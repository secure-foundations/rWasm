(module
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (func (;0;) (type 0)
    i32.const 0
    loop  ;; label = @1
    end
    i32.const 1
    drop
    drop)
  (func (;1;) (type 0)
    loop  ;; label = @1
      br 0 (;@1;)
    end)
  (func (;2;) (type 0)
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 0
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      i32.const 1234
      drop
    end
    i32.const 5678
    drop)
  (func (;3;) (type 1) (result i32)
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 0
        br_if 0 (;@2;)
        i32.const 1
        br_if 1 (;@1;)
        i32.const 2
        br_if 0 (;@2;)
        i32.const 3
        br_if 1 (;@1;)
        i32.const 4
        return
      end
    end
    i32.const 1234)
  (func (;4;) (type 1) (result i32)
    loop (result i32)  ;; label = @1
      loop (result i32)  ;; label = @2
        loop (result i32)  ;; label = @3
          loop (result i32)  ;; label = @4
            loop (result i32)  ;; label = @5
              loop (result i32)  ;; label = @6
                loop (result i32)  ;; label = @7
                  loop (result i32)  ;; label = @8
                    loop (result i32)  ;; label = @9
                      loop (result i32)  ;; label = @10
                        loop (result i32)  ;; label = @11
                          loop (result i32)  ;; label = @12
                            loop (result i32)  ;; label = @13
                              loop (result i32)  ;; label = @14
                                loop (result i32)  ;; label = @15
                                  loop (result i32)  ;; label = @16
                                    loop (result i32)  ;; label = @17
                                      loop (result i32)  ;; label = @18
                                        loop (result i32)  ;; label = @19
                                          loop (result i32)  ;; label = @20
                                            loop (result i32)  ;; label = @21
                                              i32.const 0
                                              i32.const 1
                                              br_if 20 (;@1;)
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end)
  (func (;5;) (type 0)
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 0
        drop
        block  ;; label = @3
          loop  ;; label = @4
            i32.const 1
            drop
            block  ;; label = @5
              loop  ;; label = @6
                i32.const 2
                drop
                br 5 (;@1;)
                br 4 (;@2;)
                br 3 (;@3;)
                br 2 (;@4;)
                br 1 (;@5;)
                br 0 (;@6;)
              end
            end
            i32.const 8002
            drop
          end
        end
        i32.const 8001
        drop
      end
    end
    i32.const 8000
    drop))
