package edu.wandongli.rye.typehandler;

import edu.wandongli.rye.enums.WayEnum;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import javax.servlet.annotation.HandlesTypes;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedJdbcTypes(JdbcType.INTEGER)
@MappedTypes(WayEnum.class)
public class WayTypeHandler extends BaseTypeHandler<WayEnum> {
    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, WayEnum wayEnum, JdbcType jdbcType) throws SQLException {
        preparedStatement.setInt(i, wayEnum.getId());
    }

    @Override
    public WayEnum getNullableResult(ResultSet resultSet, String s) throws SQLException {
        int id = resultSet.getInt(s);
        return WayEnum.getWayEnum(id);
    }

    @Override
    public WayEnum getNullableResult(ResultSet resultSet, int i) throws SQLException {
        int id = resultSet.getInt(i);
        return WayEnum.getWayEnum(id);
    }

    @Override
    public WayEnum getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        int id = callableStatement.getInt(i);
        return WayEnum.getWayEnum(id);
    }
}
