#!/usr/bin/env bash

# Copies files from step1 back from gkt.control to adwords.
# And renames tables as well.

set -x

mv /work/gkt.control/files/adwords/lists/nl_step_1_20141003/* /work/adwords/out/list/
rm -rf /work/gkt.control/files/adwords/lists/nl_step_1_20141003

mv /work/gkt.control/files/adwords/logs/nl_step_1_20141003/* /work/adwords/out/log/
rm -rf /work/gkt.control/files/adwords/logs/nl_step_1_20141003

mv /work/gkt.control/files/adwords/error_list/nl_step_1_20141003/* /work/adwords/out/error_list/
rm -rf /work/gkt.control/files/adwords/error_list/nl_step_1_20141003

mv /work/gkt.control/files/adwords/registration_emails/nl_step_1_20141003/* /work/adwords/out/registration_emails/
rm -rf /work/gkt.control/files/adwords/registration_emails/nl_step_1_20141003

mysql adwords_bak -e "ALTER TABLE events_nl_step_1_20141003 RENAME TO adwords.events"
mysql adwords_bak -e "ALTER TABLE keywords_nl_step_1_20141003 RENAME TO adwords.keywords"
