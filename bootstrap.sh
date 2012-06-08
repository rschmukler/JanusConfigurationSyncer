function die()
{
    echo "${@}"
    exit 1
}



if [ ! -d "~/.janus" ]; then
  mkdir "~/.janus";
fi

cd "~/.janus";
curl -Lo- "http://bit.ly/jcs-rakefile" > Rakefile;
echo "Please enter the Git repo URL you wish to use:"
read $repo
rake install_create $repo
