module Model where

type UserID = Int
type UserName = String

data User = User {
    userID :: UserID,
    userName :: UserName
} deriving (Show, Eq)

type Users = [User]

addUser :: UserID -> UserName -> Users -> Users
addUser id name users = User id name : users

removeUser :: UserID -> Users -> Users
removeUser id = filter (\user -> userID user /= id)

listUsers :: Users -> [String]
listUsers = map showUser
    where
        showUser (User id name) = "ID: " ++ show id ++ ", Nome: " ++ name