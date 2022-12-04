package com.springproject01.demo.meal;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RecordMealRepository {

    @Select("select * from meal")
    List<RecordMealEntity> findAll();

    @Insert("insert into meal (day,meal_time_zone,protein,sugar_content,lipid,vitamin,mineral) values(#{day},#{meal_time_zone},#{protein},#{sugar_content},#{lipid},#{vitamin},#{mineral})")
    void insert(@Param("day") String day, @Param("meal_time_zone") String meal_time_zone, @Param("protein") int protein,
            @Param("sugar_content") int sugar_content, @Param("lipid") int lipid, @Param("vitamin") int vitamin,
            @Param("mineral") int mineral);
}
// @Insert("insert into issues (summary,description) values
// (#{summary},#{description})")
// void insert(@Param("summary") String summary, @Param("description") String
// description);