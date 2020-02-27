package edu.wandongli.rye.typehandler;

import edu.wandongli.rye.enums.ModeEnum;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(ModeEnum.class)
@MappedJdbcTypes(JdbcType.INTEGER)
public class ModeTypeHandler extends BaseTypeHandler<ModeEnum> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, ModeEnum modeEnum, JdbcType jdbcType) throws SQLException {
        preparedStatement.setInt(i, modeEnum.getId());
    }

    @Override
    public ModeEnum getNullableResult(ResultSet resultSet, String s) throws SQLException {
        int id = resultSet.getInt(s);
        return ModeEnum.getModeEnum(id);
    }

    @Override
    public ModeEnum getNullableResult(ResultSet resultSet, int i) throws SQLException {
        int id = resultSet.getInt(i);
        return ModeEnum.getModeEnum(id);
    }

    @Override
    public ModeEnum getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        int id = callableStatement.getInt(i);
        return ModeEnum.getModeEnum(id);
    }
}
