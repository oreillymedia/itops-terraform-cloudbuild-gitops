import hvac
import os
# client = hvac.Client(url='https://itops-playground-vault-01.corp.oreilly.com:8200')
vault_token=os.environ.get("VAULT_TOKEN")
client = hvac.Client(url='https://10.200.80.2:8200', token= vault_token, verify=False, )

secret = client.secrets.gcp.generate_service_account_key(roleset="",key_type='TYPE_GOOGLE_CREDENTIALS_FILE', mount_point='gcp/static-account/sa_token')

# Print the value of the secret
print(secret)