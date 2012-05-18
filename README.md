# uberconfig #

Yet Another Ruby configuration file parser.
Right now this is just a brain dump of issues I've experienced on other projects and is mostly a wish list.

## Objective ##
### Allow for parsing of any configuration looking object ###
Including (but not limited to)
This will allow for reading in global configuration files, 

  * [INI files](http://en.wikipedia.org/wiki/INI_file)
  * YAML files
  * JSON files/strings
  * Hashes 
  * XML (why not?)
  * CSV (you get the idea...)

All of these would be separate classes that would be called from a master config object.
They would provide reader/writer methods for their particular types, and return a hash of information.

### Support hierarchical configuration ###
Allow for reading multiple objects into a master configuration object.
When queried for a value, the master object chooses the most specific value for a given key.

Example:

    Uberconfig.new([
        Uberconfig::INI.new('/etc/project/global_conf'),
        Uberconfig::YAML.new('~/local_conf'),
        Uberconfig::Hash.new(opts)  # For optparse style hashes
    ])

This would allow for an order like (highest importance first)
  1. opts
  1. local_conf
  1. global_conf

### Add more useful information to configuration objects ###
Allow a schema to be defined for configurations.
This could specify allowed keys, formats default values, value validators, and comments.

    schema = {
      :key => {
        :comment => "Some key",
        :format => Integer,
        :default => 10,
        :valid => proc{|x| x.between?(1,100)}
      }
    }

### Allow for updating a user's local configuration ###
This could be used for saving a user's options to their local configuration file.
It could also be used for adding newly defined options (for instance after updating a schema).
