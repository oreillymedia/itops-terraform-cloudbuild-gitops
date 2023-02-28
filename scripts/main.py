import hvac
import os

vault_token=os.environ.get("vault_token")
client = hvac.Client(url='https://10.200.80.2:8200', token= vault_token, verify=False, )

# secret = client.secrets.gcp.generate_service_account_key(roleset="",key_type='TYPE_GOOGLE_CREDENTIALS_FILE', mount_point='gcp/static-account/sa_token')
secret= client.secrets.kv.v1.read_secret(path='infractl/google_application_credentials/itops-playground')
# Print the value of the secret
print(secret)