
function createTable {
    found=0
    tableMetaData=""
    createTableFlag=1
    echo "enter the name of the table :"
    read tableName
    
    if [[ -f $databases/$dataBaseName/$tableName ]]
    then
        echo "table already exists..."
    else
        echo "enter the number of coulmns"
        read numOfCoulmns
        if  [[ "$numOfCoulmns" =~ ^[0-9]+$ ]]
        then
            tableMetaData+=$"numberOfCoulmns,$numOfCoulmns"$'\n'
            for ((i=0; i < $numOfCoulmns; i++)) do
                echo "enter the name of the coulmn : "
                read coulmnName
                echo "enter the data type of the coulmn : (string or number)"
                read dataTypeOfCoulmn
                if [[ $dataTypeOfCoulmn == "string" ]] || [[ $dataTypeOfCoulmn == "number" ]]
                then
                    tableMetaData+="$coulmnName,$dataTypeOfCoulmn"$'\n'
                else
                    echo "unknown data type entered..."$'\n'"please try to create the table again..."
                    createTableFlag=0
                    break;
                fi
            done
            
            if [[ $createTableFlag == 1 ]]
            then
                touch $databases/$dataBaseName/$tableName
                touch $databases/$dataBaseName/$tableName.metadata
                echo "$tableMetaData" >> $databases/$dataBaseName/$tableName.metadata
            fi
        else
            echo "invalid number of coulmns..."$'\n'"please try to create the table again..."
        fi
    fi
    
}
