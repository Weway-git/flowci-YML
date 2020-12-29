-- 用于去除由于jenkins项目，pipeline同步到平台时出现重复应用的问题
delete from application where id not in(select minid from (select min(id) minid from application GROUP BY `name`) a)