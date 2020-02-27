package edu.wandongli.rye.typehandler;

import edu.wandongli.rye.enums.PinlessEnum;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(PinlessEnum.class)
@MappedJdbcTypes(JdbcType.INTEGER)
public class PinlessTypeHandler extends BaseTypeHandler<PinlessEnum> {
    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, PinlessEnum pinlessEnum, JdbcType jdbcType) throws SQLException {
        preparedStatement.setInt(i, pinlessEnum.getId());
    }

    @Override
    public PinlessEnum getNullableResult(ResultSet resultSet, String s) throws SQLException {
        int id = resultSet.getInt(s);
        return PinlessEnum.getPinlessEnum(id);
    }

    @Override
    public PinlessEnum getNullableResult(ResultSet resultSet, int i) throws SQLException {
        int id = resultSet.getInt(i);
        return PinlessEnum.getPinlessEnum(id);
    }

    @Override
    public PinlessEnum getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        int id = callableStatement.getInt(i);
        return PinlessEnum.getPinlessEnum(id);
    }
}
