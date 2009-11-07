require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'
require 'wirble'

ARGV.concat [ "--readline" ]
  
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:USE_READLINE] = true 
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE
 
Wirble.init
Wirble.colorize
