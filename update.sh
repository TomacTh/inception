if [[ $(ls /home/tcharvet/data/wp) != "" ]] ;
then
    cd /home/tcharvet/data/wp && sudo tar -cvzp --same-owner -f /home/tcharvet/inception/srcs/requirements/wordpress/wordpress.tar.gz . ;
fi

if [[ $(ls /home/tcharvet/data/db) != "" ]] ;
then
    cd /home/tcharvet/data/db && sudo tar -cvzp --same-owner -f /home/tcharvet/inception/srcs/requirements/mariadb/mysql.tar.gz . ;
fi

if [[ $(ls /home/tcharvet/data/adminer) != "adminer-4.8.1.php" ]] ;
then
    cp ./srcs/requirements/adminer-4.8.1.php /home/tcharvet/data/adminer
fi
