class DemoExtension

    constructor: -> super

    identifier: 'demo'

    setBootstrapData: (data)->
        Skr.Extension.Demo.user_data=data

Skr.Extension.Base.extend( DemoExtension )
