// Generated by CoffeeScript 1.3.3
(function() {
  var Contractor, logr, useful,
    __slice = [].slice;

  useful = require('useful');

  logr = require('node-logr').getLogger("Contractor");

  exports.Contractor = Contractor = (function() {

    function Contractor() {}

    Contractor.Required = function() {
      return useful.makeObject({
        paramType: "required"
      });
    };

    Contractor.Optional = function() {
      return useful.makeObject({
        paramType: "optional"
      });
    };

    Contractor.Create = function() {
      var envelope, name, params;
      name = arguments[0], params = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      params = params || [];
      envelope = function() {
        var message, param, value, values, _i, _len;
        values = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        message = [name];
        for (_i = 0, _len = params.length; _i < _len; _i++) {
          param = params[_i];
          value = values.shift();
          switch (param.paramType) {
            case "required":
              if (!value) {
                logr.debug("Bad parameters for param:" + (param.toString()) + " message:" + name + " provided:" + (params.join(',')));
                return null;
              } else {
                message.push(value);
              }
              break;
            case "optional":
              message.push(value);
          }
        }
        return message;
      };
      envelope.toString = function() {
        return name;
      };
      return envelope;
    };

    return Contractor;

  })();

}).call(this);
