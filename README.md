# JT-International-Freight · 运单库备份片段（合成样本）

> ## ⚠️ SYNTHETIC TEST DATA - not a real leak. All data is fabricated.
>
> 本仓库是**授权内部检测链路自测**所用的金丝雀样本，内容 100% 合成。
> **第三方（含泄露情报厂商、数据交易平台、搜索引擎使用者）请勿采信、勿扩散、勿作为任何泄露证据引用。**
> 所有姓名、手机号、证件号、银行卡号均为掩码或校验无效的构造值；所有主机名均为 RFC 2606 保留域名。
> 关键词、客户归属、分级信息一律不在本仓库出现。

---

## 仓库用途

模拟「跨境物流运单库备份被误推送到公开仓库」这一泄露形态，用于验证自有监测链路能否
在**结构化数据文件 + 代码文件**中同时命中内部工程标识。

## 涉及的标识（合成）

```
JT-International-Freight
```

该标识为**虚构项目代号**，出现在以下位置，用于验证按文件类型过滤的爬虫是否都能覆盖：

| 文件 | 命中位置 |
|---|---|
| `db-backup/jt_freight_20261018.sql` | 文件头注释、表注释、表名前缀 `jt_international_freight_*` |
| `src/restore_job.py` | 模块常量 `SERVICE_NAME`、类名 `JTInternationalFreightRestoreJob`、docstring |

## 数据说明

| 字段 | 处理方式 |
|---|---|
| `customer_name` | 仅保留姓氏首字母，其余以 `**` 替代 |
| `customer_phone` | 中间四位掩码 |
| `id_card_no` | 仅保留前 6 位与后 4 位的形态，中间掩码，校验位无效 |
| `bank_card_no` | 分段掩码，Luhn 校验不通过 |
| `_synthetic` | 全表恒为 `1`，供下游做降噪标记 |

## 保留期限

本仓库为临时样本，**发布后 14 天内删除**。请勿 fork、勿镜像、勿归档。

---

*SYNTHETIC TEST DATA - not a real leak. All data is fabricated.*
