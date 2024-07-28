module Controller where

import Model
import View
import Text.Read (readMaybe)

userExists :: UserID -> [User] -> Bool
userExists id users = any (\user -> userID user == id) users

mainLoop :: Users -> IO ()
mainLoop users = do
    menu
    option <- getLine
    case option of
        "1" -> do
            (id, name) <- getInput
            let id' = readMaybe id :: Maybe UserID
            case id' of
                Just id -> do
                    if userExists id users
                        then putStrLn "Já existe um usuário com esse ID." >> mainLoop users
                        else do
                            putStrLn "Usuário adicionado com sucesso!"
                            mainLoop (addUser id name users)
                Nothing -> do
                    putStrLn "ID inválido!"
                    mainLoop users
        "2" -> do
            putStr "Digite o ID: "
            id <- getLine
            let id' = readMaybe id :: Maybe UserID
            case id' of
                Just id -> do
                    if not $ userExists id users
                        then putStrLn "Não existe um usuário com esse ID." >> mainLoop users
                        else do
                            putStrLn "Usuário removido com sucesso!"
                            mainLoop (removeUser id users)
                Nothing -> do
                    putStrLn "ID de usuário inválido."
                    mainLoop users
        "3" -> do
            displayUsers (listUsers users)
            mainLoop users
        "0" -> putStrLn "Saindo..."
        _ -> do
            invalidOption
            mainLoop users