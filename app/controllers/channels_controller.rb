# Copyright (C) 2012-2014 Zammad Foundation, http://zammad-foundation.org/

class ChannelsController < ApplicationController
  before_filter :authentication_check

=begin

Format:
JSON

Example:
{
  "id":1,
  "area":"Email::Inbound",
  "adapter":"IMAP",
  "group_id:": 1,
  "options":{
    "host":"mail.example.com",
    "user":"some_user",
    "password":"some_password",
    "ssl":true
  },
  "active":true,
  "updated_at":"2012-09-14T17:51:53Z",
  "created_at":"2012-09-14T17:51:53Z",
  "updated_by_id":2.
  "created_by_id":2,
}

{
  "id":1,
  "area":"Twitter::Inbound",
  "adapter":"Twitter2",
  "group_id:": 1,
  "options":{
    "consumer_key":"PJ4c3dYYRtSZZZdOKo8ow",
    "consumer_secret":"ggAdnJE2Al1Vv0cwwvX5bdvKOieFs0vjCIh5M8Dxk",
    "oauth_token":"293437546-xxRa9g74CercnU5AvY1uQwLLGIYrV1ezYtpX8oKW",
    "oauth_token_secret":"ju0E4l9OdY2Lh1iTKMymAu6XVfOaU2oGxmcbIMRZQK4",
    "search":[
      {
        "item":"#otrs",
        "group_id":1,
      },
      {
        "item":"#zombie42",
        "group_id":1,
      },
      {
        "item":"#otterhub",
        "group_id":1,
      }
    ],
    "mentions" {
      "group_id":1,
    },
    "direct_messages": {
      "group_id":1,
    }
  },
  "active":true,
  "updated_at":"2012-09-14T17:51:53Z",
  "created_at":"2012-09-14T17:51:53Z",
  "updated_by_id":2.
  "created_by_id":2,
}

=end

=begin

Resource:
GET /api/v1/channels.json

Response:
[
  {
    "id": 1,
    "area":"Email::Inbound",
    "adapter":"IMAP",
    ...
  },
  {
    "id": 2,
    "area":"Email::Inbound",
    "adapter":"IMAP",
    ...
  }
]

Test:
curl http://localhost/api/v1/channels.json -v -u #{login}:#{password}

=end

  def index
    return if deny_if_not_role('Admin')
    model_index_render(Channel, params)
  end

=begin

Resource:
GET /api/v1/channels/#{id}.json

Response:
{
  "id": 1,
  "area":"Email::Inbound",
  "adapter":"IMAP",
  ...
}

Test:
curl http://localhost/api/v1/channels/#{id}.json -v -u #{login}:#{password}

=end

  def show
    return if deny_if_not_role('Admin')
    model_show_render(Channel, params)
  end

=begin

Resource:
POST /api/v1/channels.json

Payload:
{
  "area":"Email::Inbound",
  "adapter":"IMAP",
  "group_id:": 1,
  "options":{
    "host":"mail.example.com",
    "user":"some_user",
    "password":"some_password",
    "ssl":true
  },
  "active":true,
}

Response:
{
  "area":"Email::Inbound",
  "adapter":"IMAP",
  ...
}

Test:
curl http://localhost/api/v1/channels.json -v -u #{login}:#{password} -H "Content-Type: application/json" -X POST -d '{"name": "some_name","active": true, "note": "some note"}'

=end

  def create
    return if deny_if_not_role('Admin')
    model_create_render(Channel, params)
  end

=begin

Resource:
PUT /api/v1/channels/{id}.json

Payload:
{
  "id":1,
  "area":"Email::Inbound",
  "adapter":"IMAP",
  "group_id:": 1,
  "options":{
    "host":"mail.example.com",
    "user":"some_user",
    "password":"some_password",
    "ssl":true
  },
  "active":true,
}

Response:
{
  "id": 1,
  "name": "some_name",
  ...
}

Test:
curl http://localhost/api/v1/channels.json -v -u #{login}:#{password} -H "Content-Type: application/json" -X PUT -d '{"name": "some_name","active": true, "note": "some note"}'

=end

  def update
    return if deny_if_not_role('Admin')
    model_update_render(Channel, params)
  end

=begin

Resource:
DELETE /api/v1/channels/{id}.json

Response:
{}

Test:
curl http://localhost/api/v1/channels.json -v -u #{login}:#{password} -H "Content-Type: application/json" -X DELETE

=end

  def destroy
    return if deny_if_not_role('Admin')
    model_destory_render(Channel, params)
  end
end
