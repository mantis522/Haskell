import GHC.IO.Encoding

main :: IO ()    
main = do
  setLocaleEncoding utf8
