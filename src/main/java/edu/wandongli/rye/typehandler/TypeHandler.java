package edu.wandongli.rye.typehandler;

import edu.wandongli.rye.enums.TypeEnum;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedJdbcTypes(JdbcType.INTEGER)
@MappedTypes(TypeEnum.class)
public class TypeHandler extends BaseTypeHandler<TypeEnum> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, TypeEnum typeEnum, JdbcType jdbcType) throws SQLException {
        preparedStatement.setInt(i, typeEnum.getId());
    }

    @Override
    public TypeEnum getNullableResult(ResultSet resultSet, String s) throws SQLException {
        int id = resultSet.getInt(s);
        return TypeEnum.getTypeEnum(id);
    }

    @Override
    public TypeEnum getNullableResult(ResultSet resultSet, int i) throws SQLException {
        int id = resultSet.getInt(i);
        return TypeEnum.getTypeEnum(id);
    }

    @Override
    public TypeEnum getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        int id = callableStatement.getInt(i);
        return TypeEnum.getTypeEnum(id);
    }
}
