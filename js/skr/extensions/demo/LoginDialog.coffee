class LoginDialog
    constructor: -> super
    bodyTemplateName: 'skr/extensions/demo/login-dialog'
    title: 'What should we use for your name and email?'

    events:
        'click td': 'onRoleSelection'
        'shown.bs.modal': 'onShown'

    buttons:
        login: { label: 'Start Demo', type: 'primary' }

    render: ->
        super
        this.cacheElements({
            name:  'input[name=name]', email: 'input[name=email]'
        })

    onShown: ->
        @name.value  = Skr.Extension.Demo.user_data.name
        @email.value = Skr.Extension.Demo.user_data.email
        @name.focus()

    onRoleSelection: (ev)->
        return unless ev.target.tagName == "TD"
        ev.target.parentNode.cells[0].querySelector("input").checked = true

    onLogin: (ev)->
        user = new Skr.Extension.Demo.UserModel()
        user.email = @email.value
        user.name  = @name.value
        user.role_names = [ this.query('input:checked').value ]
        Skr.View.SaveNotify(this, model: user )
            .then (reply)=>
                info = reply.response.data
                Skr.UI.current_user = new Skr.Data.User(info.user, info.access)
                @hide()


Skr.Extension.UserAccess.LoginDialog = Skr.Extension.UserAccess.LoginDialog.extend(LoginDialog)
