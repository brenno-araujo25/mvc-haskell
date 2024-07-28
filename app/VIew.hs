module View where

welcome :: String
welcome = "\nSistema Gerenciador de Usuários"

menu :: IO ()
menu = do
    putStrLn "\n1. Adicionar Usuário"
    putStrLn "2. Remover Usuário"
    putStrLn "3. Listar Usuários"
    putStrLn "0. Sair"
    putStr "\nEscolha uma opção: "

getInput :: IO (String, String)
getInput = do
    putStr "Digite o ID: "
    id <- getLine
    putStr "Digite o nome: "
    name <- getLine
    return (id, name)

invalidOption :: IO ()
invalidOption = putStrLn "Opção inválida. Tente novamente."

displayUsers :: [String] -> IO ()
displayUsers users = do
    putStrLn "\nLista de Usuários:"
    mapM_ putStrLn users