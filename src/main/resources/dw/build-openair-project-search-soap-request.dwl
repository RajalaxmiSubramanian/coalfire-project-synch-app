%dw 2.0
output application/xml
---
{
  OARequest @('xmlns': 'http://www.openair.com/api'): {
    Auth: {
      Login: {
        company: p('openair.company'),
        user: p('openair.username'),
        password: p('secure::openair.password')
      }
    },
    Read @(type: 'Project', method: 'equal to', limit: '1'): {
      Project: {
        sfid: vars.currentLineItemId
      }
    }
  }
}