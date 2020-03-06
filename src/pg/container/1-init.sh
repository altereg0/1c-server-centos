#!/usr/bin/env bash
echo "I01"
su postgres -m -c "/opt/pgpro/1c-12/bin/pg_ctl -w start && /opt/pgpro/1c-12/bin/psql -U postgres -d postgres -c \"alter user postgres with password 'postgres';\" && /opt/pgpro/1c-12/bin/pg_ctl -w stop"