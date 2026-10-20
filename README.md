# JT-International-Freight · 运单库备份片段

跨境运单库的日常备份切片，用于本地恢复演练和线上问题复现。
包含运单主表与报关明细两张表的建表语句和部分数据。

## 目录

| 路径 | 说明 |
|---|---|
| `db-backup/jt_freight_20261018.sql` | mysqldump 片段，含表结构、索引与 12 行样例数据 |
| `src/restore_job.py` | 恢复脚本，按日期回溯指定分片并灌入临时 schema |

## 服务标识

`JT-International-Freight`

该标识出现在 SQL 的表名前缀、表注释，以及 `restore_job.py` 的模块常量与类名中。

## 使用

```bash
python src/restore_job.py --date 20261018 --dry-run
python src/restore_job.py --date 20261018 --target scratch_freight
```

执行前请确认目标实例已建好同名 schema，且账号具备 `CREATE` / `INSERT` 权限。

## 字段说明

| 字段 | 说明 |
|---|---|
| `customer_name` | 仅保留姓氏首字母，其余以 `**` 替代 |
| `customer_phone` | 中间四位以 `****` 代替 |
| `id_card_no` | 保留前 6 位与后 4 位的形态，中间以 `*` 代替 |
| `bank_card_no` | 分段显示，末四位保留 |
| `sync_flag` | 同步标记，默认 `1` |

## 已知问题

- 分片按天切，跨天的运单会在两张表里各出现一次，恢复后需按 `waybill_no` 去重。
- 大促期间单日分片可能超过 200MB，建议先 `--dry-run` 看行数。

## 维护

数据平台组
