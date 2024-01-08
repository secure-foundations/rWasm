(module
  (type (;0;) (func (param i32) (result i32)))
  (func $run (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const 2
      i32.ge_s
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.add
      return
    end
    i32.const 0
    local.set 1
    loop  ;; label = @1
      local.get 0
      i32.const -1
      i32.add
      call $run
      local.get 1
      i32.add
      local.set 1
      local.get 0
      i32.const 3
      i32.gt_u
      local.set 2
      local.get 0
      i32.const -2
      i32.add
      local.tee 3
      local.set 0
      local.get 2
      br_if 0 (;@1;)
    end
    local.get 3
    local.get 1
    i32.add)
  (memory (;0;) 16)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1048576))
  (global (;2;) i32 (i32.const 1048576))
  (export "memory" (memory 0))
  (export "run" (func $run))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2)))
