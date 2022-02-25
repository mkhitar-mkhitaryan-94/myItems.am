package manager;

import db.DBConnectionProvider;
import model.Category;
import model.Item;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemManager {
    private final Connection connection = DBConnectionProvider.getInstance().getConnection();
    private final UserManager userManager = new UserManager();
    private final CategoryManager categoryManager = new CategoryManager();


    public boolean addItem(Item item) {
        String sql = "INSERT INTO item(title,description,price,category_id,user_id,pic_url) VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, item.getTitle());
            statement.setString(2, item.getDescription());
            statement.setDouble(3, item.getPrice());
            statement.setInt(4, item.getCategory().getId());
            statement.setInt(5, item.getUser().getId());
            statement.setString(6, item.getPicUrl());
            statement.executeUpdate();
            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                item.setId(resultSet.getInt(1));
            }
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public List<Item> getLastItems() {
        String sql = "SELECT * FROM item ORDER BY id DESC LIMIT 20";
        List<Item> items = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                items.add(getItemsFromResultSet(resultSet));
            }
            return items;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Item> getLastItemsByCategory(Category category) {
        String sql = "SELECT * FROM item WHERE category_id = ? ORDER BY id DESC LIMIT 20";
        List<Item> items = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, category.getId());
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                items.add(getItemsFromResultSet(resultSet));
            }
            return items;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }


    private Item getItemsFromResultSet(ResultSet resultSet) {
        try {
            return Item.builder()
                    .id(resultSet.getInt(1))
                    .title(resultSet.getString(2))
                    .description(resultSet.getString(3))
                    .price(resultSet.getDouble(4))
                    .category(categoryManager.getCategoryById(resultSet.getInt(5)))
                    .user(userManager.getUserById(resultSet.getInt(6)))
                    .picUrl(resultSet.getString(7))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Item> getCurrentUserAds(int userId){
        String sql = "SELECT * FROM item WHERE user_id = ?";
        List<Item> items = new ArrayList<>();
        try{
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1,userId);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                items.add(getItemsFromResultSet(resultSet));
            }
            return items;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}


