function mcd -d "Combines mkdir and cd"
  if mkdir $argv
    cd $argv
  end
end

