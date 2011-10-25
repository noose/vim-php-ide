rm ~/tags
for dir in sites/vod.noose.pl; do
    ctags -a -f ~/tags -h ".php" \
    -R --exclude="\.hg" \
    -R --exclude="zewnetrzne" \
    --PHP-kinds=+cf --regex-PHP='/(abstract )?class ([^ ]*)/\2/c/' \
    --regex-PHP='/interface ([^ ]*)/\1/c/' \
    --regex-PHP='/(public |protected |private |static )+function ([^ (]+)/\2/f/' \
    --regex-PHP='/(public |protected |private |static )+\$([a-zA-Z0-9_]+)/\2/v/' \
    --regex-PHP='/const ([^ (]+)/\1/d/' \
    --exclude="*.js" \
    --exclude="*.sql" \
    --exclude="*.phtml" \
    --exclude="*.tpl.php" \
    $HOME/$dir/
done
