(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (result i32)))
  (type (;2;) (func))
  (func (;0;) (type 1) (result i32)
    block (result i32)  ;; label = @1
      block (result i32)  ;; label = @2
        block (result i32)  ;; label = @3
          block (result i32)  ;; label = @4
            block (result i32)  ;; label = @5
              block (result i32)  ;; label = @6
                block (result i32)  ;; label = @7
                  block (result i32)  ;; label = @8
                    block (result i32)  ;; label = @9
                      block (result i32)  ;; label = @10
                        block (result i32)  ;; label = @11
                          block (result i32)  ;; label = @12
                            block (result i32)  ;; label = @13
                              block (result i32)  ;; label = @14
                                block (result i32)  ;; label = @15
                                  block (result i32)  ;; label = @16
                                    block (result i32)  ;; label = @17
                                      block (result i32)  ;; label = @18
                                        block (result i32)  ;; label = @19
                                          block (result i32)  ;; label = @20
                                            block (result i32)  ;; label = @21
                                              i32.const 10
                                              i32.const 8
                                              br_table 20 (;@1;) 19 (;@2;) 18 (;@3;) 17 (;@4;) 16 (;@5;) 15 (;@6;) 14 (;@7;) 13 (;@8;) 12 (;@9;) 11 (;@10;) 10 (;@11;) 9 (;@12;) 8 (;@13;) 7 (;@14;) 6 (;@15;) 5 (;@16;) 4 (;@17;) 3 (;@18;) 2 (;@19;) 1 (;@20;) 0 (;@21;)
                                            end
                                            i32.const 20
                                            drop
                                          end
                                          i32.const 19
                                          drop
                                        end
                                        i32.const 18
                                        drop
                                      end
                                      i32.const 17
                                      drop
                                    end
                                    i32.const 16
                                    drop
                                  end
                                  i32.const 15
                                  drop
                                end
                                i32.const 14
                                drop
                              end
                              i32.const 13
                              drop
                            end
                            i32.const 12
                            drop
                          end
                          i32.const 11
                          drop
                        end
                        i32.const 10
                        drop
                      end
                      i32.const 9
                      drop
                    end
                    i32.const 8
                    drop
                  end
                  i32.const 7
                  drop
                end
                i32.const 6
                drop
              end
              i32.const 5
              drop
            end
            i32.const 4
            drop
          end
          i32.const 3
          drop
        end
        i32.const 2
        drop
      end
      i32.const 1
      drop
    end
    i32.const 0
    drop)
  (func (;1;) (type 0) (param i32 i32) (result i32)
    i32.const 0
    i32.const 1
    i32.add)
  (func (;2;) (type 2)
    i32.const 10
    i32.const 20
    call 1
    drop)
  (func (;3;) (type 2)
    (local i32 i32)
    i32.const 10
    i32.const 20
    call 1
    drop)
  (func (;4;) (type 2)
    i32.const 10
    i32.const 20
    i32.const 3
    call_indirect (type 0)
    drop)
  (func (;5;) (type 2)
    (local i32 i32)
    i32.const 10
    i32.const 20
    i32.const 3
    call_indirect (type 0)
    drop)
  (func (;6;) (type 0) (param i32 i32) (result i32)
    i32.const 0
    i32.const 1
    i32.add)
  (func (;7;) (type 0) (param i32 i32) (result i32)
    i32.const 0
    i32.const 1
    i32.add)
  (func (;8;) (type 0) (param i32 i32) (result i32)
    i32.const 0
    i32.const 1
    i32.add)
  (func (;9;) (type 0) (param i32 i32) (result i32)
    i32.const 0
    i32.const 1
    i32.add)
  (func (;10;) (type 0) (param i32 i32) (result i32)
    i32.const 0
    i32.const 1
    i32.add)
  (table (;0;) 5 5 funcref)
  (export "dummy0" (func 6))
  (elem (;0;) (i32.const 0) func 6 7 8 9 10))
