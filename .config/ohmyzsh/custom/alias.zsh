alias ell="exa --long --header --git --all --icons"
alias et="exa --tree --level=2 --icons"
alias et3="exa --tree --level=3 --icons"

alias vim=nvim

alias sz="source ~/.zshrc"
alias ca="lvim ~/.config/ohmyzsh/custom/alias.zsh"

# PYTHON
alias venv:init="python -m venv .venv"
alias venv:activate="source .venv/bin/activate"
alias pip:update="python -m pip install --upgrade pip"

# Docker
alias docker:elastic="docker run -d --name elastic --hostname docker-elastic -p 9200:9200 -p 9300:9300 -v $HOME/data/elastic:/var/lib/elasticsearch/data -e 'discovery.type=single-node' docker.elastic.co/elasticsearch/elasticsearch:7.14.0"
alias docker:kibana="docker run -d --name kibana --hostname docker-kibana -p 5601:5601 -v $HOME/data/kibana:/var/www -e ELASTICSEARCH_HOSTS=\"['http://localhost:9200']\" 'docker.elastic.co/kibana/kibana:7.14.0'"
