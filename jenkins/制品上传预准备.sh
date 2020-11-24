# 阶段1：制品仓库
# 变量：产物路径
art_path="target"



app_default_name="publish"
# 制品清理
# - - - - -  - - - - - - - -  -
rm -rf ${WORKSPACE}/publish/*


# 新建publish目录
mkdir publish | true
# 本地仓库清理
rm -rf ${WORKSPACE}/publish/*
# 产物上传准备,（先认为是jar）
cp -rf ${WORKSPACE}/${art_path}/*.jar  ${WORKSPACE}/publish/
cd ${WORKSPACE}/publish/
# 制品压缩
tar -cvf ${app_default_name}.tar *



# - - - -  - - - - - - - - - - - 

# 阶段2：制品依赖检索
# （如果为非java项目则无需配置）
# 准备

cd ${WORKSPACE}/publish/
jar -xvf *.jar  >> /dev/null
cd BOOT-INF/lib/
echo - - - - - - - -
ls
echo - - - - - - -  -
