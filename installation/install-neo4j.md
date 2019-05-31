neo4j部署

    <!--尝试yum安装方式，不行，太慢了-->
    --------
    1、到/tmp下载 key
    cd /tmp
    wget http://debian.neo4j.org/neotechnology.gpg.key

    2、创建/etc/yum.repos.d/neo4j.repo 文件
    rpm --import neotechnology.gpg.key

    cat <<EOF>  /etc/yum.repos.d/neo4j.repo
    [neo4j]
    name=Neo4j Yum Repo
    baseurl=http://yum.neo4j.org/stable
    enabled=1
    gpgcheck=1
    EOF

    3、 yum安装
    
    yum install neo4j
    
    失败了，下载速度如蜗牛
        
    下载安装包
    ------
    https://neo4j.com/download-center/#releases
    社区版：3.5.6
    https://neo4j.com/download-thanks/?edition=community&release=3.5.6&flavour=unix&_ga=2.88266395.1871362696.1558761448-493791596.1558761448
    
    tar -zxvf ***********
    mv ***** /root/runtime/neo4j
    cd neo4j/conf
    vim conf
    '''
    neo4j配置
    
    （1）若使除安装neo4j的本机外的浏览器可以通过web端访问neo4j的可视化界面，需要执行以下操作    
    vim /etc/neo4j/neo4j.conf
    把下面这段内容的注释取消
    （把“#”删掉即可）
    dbms.connectors.default_listen_address=0.0.0.0
    
    '''
    '''
    其他配置
    ----
    # 修改第22行load csv时l路径，在前面加个#，可从任意路径读取文件
    #dbms.directories.import=import
    
    # 修改35行和36行，设置JVM初始堆内存和JVM最大堆内存
    # 生产环境给的JVM最大堆内存越大越好，但是要小于机器的物理内存
    dbms.memory.heap.initial_size=5g
    dbms.memory.heap.max_size=10g
    
    # 修改46行，可以认为这个是缓存，如果机器配置高，这个越大越好
    dbms.memory.pagecache.size=10g
    
    # 修改54行，去掉改行的#，可以远程通过ip访问neo4j数据库
    dbms.connectors.default_listen_address=0.0.0.0
    
    # 默认 bolt端口是7687，http端口是7474，https关口是7473，不修改下面3项也可以
    # 修改71行，去掉#，设置http端口为7687，端口可以自定义，只要不和其他端口冲突就行
    #dbms.connector.bolt.listen_address=:7687
    
    # 修改75行，去掉#，设置http端口为7474，端口可以自定义，只要不和其他端口冲突就行
    dbms.connector.http.listen_address=:7474
    
    # 修改79行，去掉#，设置http端口为7473，端口可以自定义，只要不和其他端口冲突就行
    dbms.connector.https.listen_address=:7473
    
    # 修改227行，去掉#，允许从远程url来load csv
    dbms.security.allow_csv_import_from_file_urls=true
    
    # 修改246行，允许使用neo4j-shell，类似于mysql 命令行之类的
    dbms.shell.enabled=true
    
    # 修改235行，去掉#，设置连接neo4j-shell的端口，一般都是localhost或者127.0.0.1，这样安全，其他地址的话，一般使用https就行
    dbms.shell.host=127.0.0.1
    
    # 修改250行，去掉#，设置neo4j-shell端口，端口可以自定义，只要不和其他端口冲突就行
    dbms.shell.port=1337
    
    # 修改254行，设置neo4j可读可写
    dbms.read_only=false
    --------------------- 

    '''