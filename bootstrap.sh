function die()
{
    echo "${@}"
    exit 1
}



if [ ! -d "~/.janus" ]; then
  mkdir "~/.janus";
fi

cd "~/.janus";
wget "http://bit.ly/LI1GWg";
rake install_create || die;
