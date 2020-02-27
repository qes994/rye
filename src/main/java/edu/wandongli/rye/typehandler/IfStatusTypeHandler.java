package edu.wandongli.rye.typehandler;

import edu.wandongli.rye.enums.IfStatusEnum;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(IfStatusEnum.class)
@MappedJdbcTypes(JdbcType.INTEGER)
public class IfStatusTypeHandler extends BaseTypeHandler<IfStatusEnum> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, IfStatusEnum IfStatusEnum, JdbcType jdbcType) throws SQLException {
        preparedStatement.setInt(i, IfStatusEnum.getId());
    }

    @Override
    public IfStatusEnum getNullableResult(ResultSet resultSet, String s) throws SQLException {
        int id = resultSet.getInt(s);
        return IfStatusEnum.getIfStatusEnum(id);
    }

    @Override
    public IfStatusEnum getNullableResult(ResultSet resultSet, int i) throws SQLException {
        int id = resultSet.getInt(i);
        return IfStatusEnum.getIfStatusEnum(id);
    }

    @Override
    public IfStatusEnum getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        int id = callableStatement.getInt(i);
        return IfStatusEnum.getIfStatusEnum(id);
    }
}
