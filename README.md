Custom Error Message
====================

This plugin gives you the option to not have your custom validation error message 
prefixed with the attribute name.

Rails 4
--------------------

This only works with Rails 4

Installation
------------
    gem 'custom_error_message', git: 'https://github.com/thethanghn/custom-err-msg.git'

Usage
-----

Sometimes generated error messages don't make sense.

    validates_acceptance_of :accepted_terms, :message => 'Please accept the terms of service'

This generates the error message:

    Accepted terms Please accept the terms of service
    
This plugin uses the carat (^) to omit the name of the attribute from error messages:

    validates_acceptance_of :accepted_terms, :message => '^Please accept the terms of service'
    
This now generates:

    Please accept the terms of service

CREDITS
-------

This plugin was originally written by David Easley (easleydp@gmail.com)