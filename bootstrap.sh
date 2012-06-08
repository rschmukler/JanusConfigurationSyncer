function die()
{
    echo "${@}"
    exit 1
}



if [ ! -d "~/.janus" ]; then
  mkdir "~/.janus";
fi

cd "~/.janus";
curl -Lo- "http://bit.ly/confsync-rakefile" > Rakefile;
rake install_create || die;
