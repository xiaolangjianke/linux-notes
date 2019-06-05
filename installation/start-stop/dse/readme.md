# DSE 部署说明

> start-dse-all.sh 和 stop-dse-all.sh 位置摆放参考下目录

DSE 目录
```
[root@app3-etl-dse-uac-ia ~]# tree runtime/
runtime/
├── DDSE_RDB-READ
│   └── target
│       └── logs
│           ├── error.log
│           └── info.log
├── DSE_RDB_APIE
│   ├── easyreport-web
│   │   └── target
│   │       └── logs
│   │           ├── error.log
│   │           └── info.log
│   ├── nohup.out
│   └── RDB_APIE.jar
├── DSE_RDB_READ
│   ├── DDSE_RDB-READ
│   │   └── target
│   │       └── logs
│   │           ├── error.log
│   │           └── info.log
│   ├── nohup.out
│   └── RDB_READ.jar
├── easyreport-web
│   └── target
│       └── logs
│           ├── error.log
│           └── info.log
├── RDB_APIE.log
├── RDB_READ_log
│   └── 2019-05-23.log
├── RDB_READ.log
├── start-dse-all.sh
└── stop-dse-all.sh

15 directories, 17 files
```

## DSE 自身

- 修改自身程序数据源(jar包中的配置,先解压->修改->再次打包jar)
- 修改远程业务数据库数据源
- 更新ezrpt_meta_report中jdbc连接
    > 已使用sql 批量替换为"etl.zhgf.cn",今后切部署时,直接在dse所在机器上
    配置/etc/hosts文件,将"etl.zhgf.cn" 指向目标服务器地址即可;
    ```sql
    # 查询出老的请求记录
      SELECT * FROM ezrpt_meta_report WHERE data_url LIKE "192.168.1.87%";
    #批量更新
      	
        UPDATE ezrpt_meta_report 
        SET data_url = REPLACE ( data_url, "192.168.1.87", "dse.zhgf.cn" ) 
        WHERE
        data_url LIKE "192.168.1.87%";;
    ```

## 业务系统使用

- 修改 getAnalysisData.properties
    ```
    #DDSE地址前缀
    DDSEUrl=http://dse.zhgf.cn:8090/report/getDataSet.ddse.page?uid=
    ```
- 修改门户爬虫数据源、国防潜力数据源对应的数据库地址