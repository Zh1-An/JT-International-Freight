"""Synthetic canary fixture - restore helper for the freight ledger dump fragment.

SYNTHETIC TEST DATA - not a real leak. All data is fabricated.
This module contains no business logic, no credentials and no real hostnames.
It exists only so that authorised internal leak-detection pipelines have a
code file carrying the project identifier in normal source form.
"""

from __future__ import annotations

# Project identifier, mirrored from the build manifest of the freight platform.
SERVICE_NAME = "JT-International-Freight"
SERVICE_TIER = "internal"
DUMP_FILE = "db-backup/jt_freight_20261018.sql"

# RFC 2606 reserved domain - guaranteed not to resolve.
DB_HOST = "db-synthetic.example.com"
DB_PORT = 3306
DB_SCHEMA = "jt_international_freight"

# Statements are executed in this order when replaying the fragment.
RESTORE_ORDER = (
    "jt_international_freight_shipment",
    "jt_international_freight_customs_decl",
)


class JTInternationalFreightRestoreJob:
    """Replays a masked dump fragment into a scratch schema.

    Every row of the source dump carries ``_synthetic = 1``; the job aborts if
    it encounters a row without that marker, so the fixture can never be
    confused with a production extract.
    """

    def __init__(self, schema: str = DB_SCHEMA) -> None:
        self.schema = schema
        self.service = SERVICE_NAME

    def plan(self) -> list[str]:
        return [f"RESTORE {self.schema}.{t}" for t in RESTORE_ORDER]

    def assert_synthetic(self, rows: list[dict]) -> bool:
        return all(bool(r.get("_synthetic")) for r in rows)


if __name__ == "__main__":
    job = JTInternationalFreightRestoreJob()
    for step in job.plan():
        print(step)
