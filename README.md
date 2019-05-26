# synology-notifications

Receive notifcations from Synology and forward them to the notifcation service of your choice

## Supported notifcation services

- Slack

## Service settings

<aside class="notice">
Settings are supplied by setting envrionment variables
</aside>

- `API_KEY`: A minum of 32 character api key that Synology server needs to use to auth to this services api
- `LISTEN_PORT`: Default of 8080. The port the service will listen on 

## Slack settings

- `SLACK_WEBHOOK`: URL for the Slack web hook

## Cmd

```bash
export API_KEY='LO45UXS%amLAWJn6CwJ1koaXW&7pY9#Z'
export SLACK_WEBHOOK='https://slack.com/myWebHookUrl'
./synology-notifications
listening on port 8080
```

## Docker

```bash
docker run -e API_KEY='LO45UXS%amLAWJn6CwJ1koaXW&7pY9#Z' -e SLACK_WEBHOOK='https://slack.com/myWebHookUrl' ryancurrah/synology-notifications:latest
listening on port 8080
```

## Setting up Synology

1. Login to Diskstation
2. Go to `Control Pannel` > `Notification` > `SMS`
3. Check `Enable SMS Notifcations`
4. Click `Add SMS Provider` to create a new SMS provider which will be the `synology-notifications` service. We will not actually be using `SMS`
    a. Provider Name: `synology-notifications`
    b. SMS URL: `http://<ip address of synology-notifications service>:8080`
    c. HTTP Method: `POST` and click `Next`
    d. Click `Add` and set the Parameter to `api_key` and leave Value empty then click `Next`
    e. Click `Add` and set the Paramater to `phone_number` and leave Value empty (Synology requires this field to exist even though were not going to use it)
    f. Click `Add` and set the Paramater to `message` set the Value to `Hello world` (Synology requires a sample value) and click `Next`
    g. Set the type of the `api_key` Parameter to `API Key`
    h. Set the type of the `phone_number` Parameter to `Phone Number`
    i. Set the type of the `message` Parameter to `Message content` and click `Apply`
5. Select `synology-notifications` from the `SMS service provider` dropdown
6. In the `API Key` field paste the API Key you choose for the service and click `Apply`
7. Test the notifcation service by clicking `Send a test SMS message`
