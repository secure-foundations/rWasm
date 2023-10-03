(module
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (func (;0;) (type 0)
    i32.const 0
    if  ;; label = @1
      i32.const 0
      drop
    else
      i32.const 1
      drop
    end)
  (func (;1;) (type 1) (result i32)
    i32.const 0
    if (result i32)  ;; label = @1
      i32.const 0
    else
      i32.const 1
    end)
  (func (;2;) (type 1) (result i32)
    i32.const 0
    if (result i32)  ;; label = @1
      i32.const 0
      return
    else
      i32.const 1
    end)
  (func (;3;) (type 1) (result i32)
    i32.const 0
    if (result i32)  ;; label = @1
      i32.const 0
    else
      i32.const 1
      return
    end)
  (func (;4;) (type 1) (result i32)
    i32.const 0
    if (result i32)  ;; label = @1
      i32.const 0
      return
    else
      i32.const 1
      return
    end))
