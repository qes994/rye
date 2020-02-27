package edu.wandongli.rye.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import edu.wandongli.rye.pojo.Section;
import org.springframework.stereotype.Repository;

@Repository
public interface SectionDao extends BaseMapper<Section> {

    //根据主键查看所有
    Section findSectionById(Long id);

}
