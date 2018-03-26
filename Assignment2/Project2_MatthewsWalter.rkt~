#lang plai

(require racket/path)

;;creates global list variable called tokens
;;reads in every line from tokens file and saves
;;each token/lexeme pair as a separate list item
;(define tokens (file->lines (string->path "D:\\Dropbox\\auburn_faculty\\RacketPrograms\\tokens")));;school computer
;(define tokens (file->lines (string->path "F:\\Dropbox\\auburn_faculty\\RacketPrograms\\tokens")));;home computer
(define tokens (file->lines (string->path "/Users/collinmatthews/Documents/Computer Science/COMP 3220/Assignment2/tokens.txt")))

;;helper function
;;retrieves the first token from the list of tokens
(define current_token
  (lambda ()
    (regexp-split #px" " (car tokens))
    );end lambda
  );end current_token

;;helper function
;;removes one token from the tokens list
;;so that current_token function always extracts
;;the next available token
(define next_token
  (lambda ()
    (set! tokens (cdr tokens))
    (cond
      ((null? tokens)
       (display "No more tokens to parse!")
       (newline)
       (display "Exiting prematurely, no eof found")
       (newline)
       (exit)
       );end null tokens
       ;((equal? (car (current_token) "eof")
        ;(display "End of File")
        ;(newline)
        ;(exit)))
      (else
       (cond
         ((equal? (car (current_token)) "whitespace")
          (next_token);call yourself again
          )     
         );end cond
       );end else
      );end cond
    );end lambda
  );end next_token
    

;;checks ID rule
;;if current_token is an id token
;;displays message found + lexeme that was encountered
;;in addition, also displays when entering or leaving
;;function (parse trace)
;;if current_token is not id, displays an error message
(define id
  (lambda ()
    (display "Entering <id>")
    (newline)
    (cond
      ((equal? (car (current_token)) "id")
       (display "Found ")
       (display (second (current_token)))
       (newline)
       (next_token)
       (display "Leaving <id>")
       (newline)
       );end first equality check in condition
      (else
       (display "Not an id token: Error")
       (newline)
       );end else statement
      );end condition block
    );end lambda
  );end id

;;checks int rule
;;if current_token is an int token
;;displays message found + lexeme that was encountered
;;in addition, also displays when entering or leaving
;;function (parse trace)
;;if current_token is not int, displays an error message
(define int
  (lambda ()
    (display "Entering <int>")
    (newline)
    (cond
      ((equal? (car (current_token)) "int")
       (display "Found ")
       (display (second (current_token)))
       (newline)
       (next_token)
       (display "Leaving <int>")
       (newline)
       );end first equality check in condition
      (else
       (display "Not an int token: Error")
       (newline)
       );end else statement
      );end condition block
    );end lambda
  );end int

;;checks factor rule
;;prints terminals along the way, calling the appropriate function
;;for non-terminals
;;displays message found + lexeme that was encountered
;;in addition, also displays when entering or leaving
;;function (parse trace)
(define factor
  (lambda ()
    (display "Entering <factor>")
    (newline)
    (cond
      ((equal? (car (current_token)) "(")
       (display "Found ")
       (display (second (current_token)))
       (newline)
       (next_token)
       (exp)
       (cond
         ((equal? (car (current_token)) ")")
          (display "Found ")
          (display (second (current_token)))
          (newline)
          (next_token)
          (display "Leaving <factor>")
          (newline)
          )
       (else
          (display "Not a factor token: Error")
          (newline)
          )
       )
       )
      ((equal? (car (current_token)) "int")
       (int)
       (display "Leaving <factor>")
       (newline)
       )
      ((equal? (car (current_token)) "id")
       (id)
       (display "Leaving <factor>")
       (newline)
       )
      (else
       (display "Not a factor token: Error")
       (newline)
       )
      )
     )
    )

  

;;checks exp rule
;;prints terminals along the way, calling the appropriate function
;;for non-terminals
;;displays message found + lexeme that was encountered
;;in addition, also displays when entering or leaving
;;function (parse trace)
(define exp
  (lambda ()
    (display "Entering <exp>")
    (newline)
    (term)
    (etail)
    (display "Leaving <exp>")
    (newline)
    
    );end lambda
  );end define exp

;;check pgm rule
(define pgm
  (lambda ()
    (display "Entering <pgm>")
    (newline)
    (stmt)
    (display "Leaving <pgm>")
    (newline)
    )
  )

;;check stmt rule
(define stmt
  (lambda ()
     (display "Entering <stmt>")
     (newline)
     (cond
       ((equal? (car (current_token)) "id")
        (assign)
        (display "Leaving <stmt>")
        (newline)
        (stmt)
        )
       ((equal? (car (current_token)) "print")
        (display "Found ")
        (display (second (current_token)))
        (newline)
        (next_token)
        (exp)
        (display "Leaving <stmt>")
        (newline)
        )
       (else
        (display "Not a <stmt>: Error")
        (newline)
        )
       )
       )
     )
  

;;check assign rule
(define assign
  (lambda ()
    (display "Entering <assign>")
    (newline)
    (id)
    (cond
      ((equal? (car (current_token)) "=")
       (display "Found ")
       (display (second (current_token)))
       (newline)
       (next_token)
       (exp)
       (display "Leaving <assign>")
       (newline)
       )
      (else
       (display "Not a = token: Error")
       (newline)
       )
      )
    )
  )

;; check etail rule
(define etail
  (lambda ()
    (display "Entering <etail>")
    (newline)
    (cond
      ((equal? (car (current_token)) "+")
       (display "Found ")
       (display (second (current_token)))
       (newline)
       (next_token)
       (term)
       (etail)
       (display "Leaving <etail>")
       (newline)
       )
      ((equal? (car (current_token)) "-")
       (display "Found ")
       (display (second (current_token)))
       (newline)
       (next_token)
       (term)
       (etail)
       (display "Leaving <etail>")
       (newline)
       )
      (else
       (display "Next token is not + or -, choosing EPSILON production")
       (newline)
       (display "Leaving <etail>")
       (newline)
       )
      )
    )
  )

;;check term rule
(define term
  (lambda ()
    (display "Entering <term>")
    (newline)
    (factor)
    (ttail)
    (display "Leaving <term>")
    (newline)
    )
  )

;;check ttail rule
(define ttail
  (lambda ()
    (display "Entering <ttail>")
    (newline)
    (cond
      ((equal? (car (current_token)) "*")
       (display "Found ")
       (display (second (current_token)))
       (newline)
       (next_token)
       (factor)
       (ttail)
       (display "Leaving <ttail>")
       (newline)
       )
      ((equal? (car (current_token)) "/")
       (display "Found ")
       (display (second (current_token)))
       (newline)
       (next_token)
       (factor)
       (ttail)
       (display "Leaving <ttail>")
       (newline)
       )
      (else
       (display "Next token is not * or /, choosing EPSILON production")
       (newline)
       (display "Leaving <ttail>")
       (newline)
       )
      )
    )
  )

;;check whitespace rule
(define whitespace
  (lambda ()
    (display "Entering <whitespace>")
    (newline)
    (cond
      ((equal? (car (current_token)) " ")
       (display "Found whitespace")
       (newline)
       (next_token)
       (display "Leaving <whitespace>")
       (newline)
       )
      (else
       (display "Not a <whitespace> token: Error")
       (newline)
       )
      )
    )
  )


;;eof rule
(define eof
  (lambda ()
    (cond
      ((equal? (car (current_token)) "eof")
       (display "End of File")
       (exit)
       )
      )
    )
  )
       
         
;;test function to test whether or not next_token
;;will actually terminate program when it encounters
;;eof
(define tt
  (lambda ()
    (display (current_token))
    (newline)
    (next_token)
    (tt)
    )
  )