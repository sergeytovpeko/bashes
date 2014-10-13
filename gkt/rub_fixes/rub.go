package main

import (
    "log"
    "os"
    "encoding/csv"
    "io"
    "fmt"
    "strconv"
)

var (
    inputFile string
    pattern string
)

func main() {
    if len(os.Args) < 3 {
        log.Println("rub inputfile match")
    }
    inputFile = os.Args[1]
    pattern = os.Args[2]

    file, err := os.Open(inputFile)
    if err != nil {
        log.Fatal("Can't open file")
    }
    defer file.Close()

    reader := csv.NewReader(file)
    reader.Comma = ';'
    for {
        record, err := reader.Read()
        // end-of-file is fitted into err
        if err == io.EOF {
            break
        } else if err != nil {
            log.Println("Error:")
            return
        }
        if record[0] == pattern {
            // fmt.Printf("%s %s\n", record[0], record[1])
            f, err := strconv.ParseFloat(record[1], 32)
            if err != nil {
                return
            }
            fmt.Printf("%d\n", int(f))

            return
        }
    }


}
