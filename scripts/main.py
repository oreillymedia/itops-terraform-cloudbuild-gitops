import hvac

# client = hvac.Client(url='https://itops-playground-vault-01.corp.oreilly.com:8200')
client = hvac.Client(url='https://10.200.80.2:8200', verify=False)

secret = client.secrets.gcp.generate_service_account_key(roleset="",key_type='TYPE_GOOGLE_CREDENTIALS_FILE', mount_point='gcp/static-account/sa_token')

# Print the value of the secret
print(secret)