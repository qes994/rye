package edu.wandongli.rye.typehandler;

import edu.wandongli.rye.enums.StatusEnum;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(StatusEnum.class)
@MappedJdbcTypes(JdbcType.INTEGER)
public class StatusTypeHandler extends BaseTypeHandler<StatusEnum> {
    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, StatusEnum StatusEnum, JdbcType jdbcType) throws SQLException {
        preparedStatement.setInt(i, StatusEnum.getId());
    }

    @Override
    public StatusEnum getNullableResult(ResultSet resultSet, String s) throws SQLException {
        int id = resultSet.getInt(s);
        return StatusEnum.getStatusEnum(id);
    }

    @Override
    public StatusEnum getNullableResult(ResultSet resultSet, int i) throws SQLException {
        int id = resultSet.getInt(i);
        return StatusEnum.getStatusEnum(id);
    }

    @Override
    public StatusEnum getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        int id = callableStatement.getInt(i);
        return StatusEnum.getStatusEnum(id);
    }
}
