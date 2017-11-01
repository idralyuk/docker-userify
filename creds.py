# Userify Credentials Configuration
# This file should be owned and readable only by root.

# This file sourced by both Python and Bash scripts, so please ensure changes
# are loadable by each.

# Instantly move this server to a different server group, even a server group
# in a different company, by replacing these with the credentials for the new
# server group.
import os

company = os.environ['USERIFY_COMPANY']
project = os.environ['USERIFY_PROJECT']

api_id  = os.environ['USERIFY_API_ID']
api_key = os.environ['USERIFY_API_KEY']
