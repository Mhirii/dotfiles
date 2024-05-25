function getVitePID --wraps=pgrep\ -a\ node\ \|\ rg\ internship\ \|\ sed\ \'s/\ .\*//\' --description alias\ getVitePID\ pgrep\ -a\ node\ \|\ rg\ internship\ \|\ sed\ \'s/\ .\*//\'
  pgrep -a node | rg internship | sed 's/ .*//' $argv
        
end
