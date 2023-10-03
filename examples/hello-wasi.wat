(module
  (type (;0;) (func))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32) (result i64)))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32 i32)))
  (type (;5;) (func (param i32) (result i32)))
  (type (;6;) (func (param i32 i32)))
  (type (;7;) (func (param i32 i32 i32)))
  (type (;8;) (func (param i32 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;10;) (func (param i32 i32 i32 i32 i32)))
  (type (;11;) (func (result i32)))
  (type (;12;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;13;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;14;) (func (param i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;15;) (func (param i64 i32 i32) (result i32)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__wasi_proc_exit (type 1)))
  (import "wasi_snapshot_preview1" "fd_write" (func $_ZN4wasi13lib_generated22wasi_snapshot_preview18fd_write17hfbffe82bfc68da68E (type 9)))
  (import "wasi_snapshot_preview1" "fd_prestat_get" (func $__wasi_fd_prestat_get (type 3)))
  (import "wasi_snapshot_preview1" "fd_prestat_dir_name" (func $__wasi_fd_prestat_dir_name (type 8)))
  (import "wasi_snapshot_preview1" "environ_sizes_get" (func $__wasi_environ_sizes_get (type 3)))
  (import "wasi_snapshot_preview1" "environ_get" (func $__wasi_environ_get (type 3)))
  (func $__wasm_call_ctors (type 0)
    call $__wasilibc_initialize_environ_eagerly
    call $__wasilibc_populate_libpreopen)
  (func $_start (type 0)
    (local i32)
    call $__wasm_call_ctors
    call $__original_main
    local.set 0
    call $__prepare_for_exit
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      call $__wasi_proc_exit
      unreachable
    end)
  (func $_ZN4core3fmt9Arguments6new_v117h329be3facaa49031E (type 10) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 5
    i32.const 16
    local.set 6
    local.get 5
    local.get 6
    i32.sub
    local.set 7
    i32.const 0
    local.set 8
    local.get 7
    local.get 8
    i32.store offset=8
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 7
    i32.load offset=8
    local.set 9
    local.get 7
    i32.load offset=12
    local.set 10
    local.get 0
    local.get 9
    i32.store offset=8
    local.get 0
    local.get 10
    i32.store offset=12
    local.get 0
    local.get 3
    i32.store offset=16
    local.get 0
    local.get 4
    i32.store offset=20
    return)
  (func $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h19a2a61da5d6a26cE (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set 0
    local.get 0
    i32.load
    local.set 4
    local.get 4
    call $_ZN4core3ops8function6FnOnce9call_once17hb7bb02843ab0037dE
    local.set 5
    i32.const 16
    local.set 6
    local.get 3
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set 0
    local.get 5
    return)
  (func $_ZN4core3ops8function6FnOnce9call_once17hb7bb02843ab0037dE (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set 0
    i32.const 4
    local.set 4
    local.get 3
    local.get 4
    i32.add
    local.set 5
    local.get 5
    local.set 6
    local.get 3
    local.get 0
    i32.store offset=4
    local.get 6
    call $_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h0e98a8fdad6ece05E
    local.set 7
    i32.const 16
    local.set 8
    local.get 3
    local.get 8
    i32.add
    local.set 9
    local.get 9
    global.set 0
    local.get 7
    return)
  (func $_ZN4core3ptr13drop_in_place17hbdefc172b9ada5feE (type 1) (param i32)
    (local i32 i32)
    global.get 0
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    drop
    return)
  (func $_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17h5c1886bfbfe252adE (type 11) (result i32)
    (local i32 i32 i32 i32)
    i32.const 0
    local.set 0
    i32.const 1
    local.set 1
    local.get 0
    local.get 1
    i32.and
    local.set 2
    local.get 2
    call $_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17ha5e320ac3a1f670bE
    local.set 3
    local.get 3
    return)
  (func $_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17ha5e320ac3a1f670bE (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set 0
    i32.const 15
    local.set 4
    local.get 3
    local.get 4
    i32.add
    local.set 5
    local.get 5
    local.set 6
    local.get 0
    local.set 7
    local.get 3
    local.get 7
    i32.store8 offset=15
    local.get 6
    call $_ZN3std3sys4wasi7process8ExitCode6as_i3217ha6343d4419ced070E
    local.set 8
    i32.const 16
    local.set 9
    local.get 3
    local.get 9
    i32.add
    local.set 10
    local.get 10
    global.set 0
    local.get 8
    return)
  (func $_ZN3std2rt10lang_start17hadf3fca7e8322d80E (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set 0
    i32.const 1048576
    local.set 6
    local.get 6
    local.set 7
    i32.const 12
    local.set 8
    local.get 5
    local.get 8
    i32.add
    local.set 9
    local.get 9
    local.set 10
    local.get 5
    local.get 0
    i32.store offset=12
    local.get 10
    local.get 7
    local.get 1
    local.get 2
    call $_ZN3std2rt19lang_start_internal17h671cbf6e632f7250E
    local.set 11
    i32.const 16
    local.set 12
    local.get 5
    local.get 12
    i32.add
    local.set 13
    local.get 13
    global.set 0
    local.get 11
    return)
  (func $_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h0e98a8fdad6ece05E (type 5) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.load
    local.set 1
    local.get 1
    call_indirect (type 0)
    call $_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17h5c1886bfbfe252adE
    local.set 2
    local.get 2
    return)
  (func $_ZN5hello4main17hd078db076938ab99E (type 0)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 0
    i32.const 32
    local.set 1
    local.get 0
    local.get 1
    i32.sub
    local.set 2
    local.get 2
    global.set 0
    i32.const 8
    local.set 3
    local.get 2
    local.get 3
    i32.add
    local.set 4
    local.get 4
    local.set 5
    i32.const 1
    local.set 6
    i32.const 0
    local.set 7
    i32.const 0
    local.set 8
    local.get 8
    i32.load offset=1048624
    local.set 9
    i32.const 0
    local.set 10
    local.get 10
    i32.load offset=1048628
    local.set 11
    local.get 5
    local.get 9
    local.get 6
    local.get 11
    local.get 7
    call $_ZN4core3fmt9Arguments6new_v117h329be3facaa49031E
    i32.const 8
    local.set 12
    local.get 2
    local.get 12
    i32.add
    local.set 13
    local.get 13
    local.set 14
    local.get 14
    call $_ZN3std2io5stdio6_print17h53f0a7747fc3663eE
    i32.const 32
    local.set 15
    local.get 2
    local.get 15
    i32.add
    local.set 16
    local.get 16
    global.set 0
    return)
  (func $__original_main (type 11) (result i32)
    (local i32 i32 i32)
    i32.const 4
    local.set 0
    i32.const 0
    local.set 1
    local.get 0
    local.get 1
    local.get 1
    call $_ZN3std2rt10lang_start17hadf3fca7e8322d80E
    local.set 2
    local.get 2
    return)
  (func $main (type 3) (param i32 i32) (result i32)
    (local i32)
    call $__original_main
    local.set 2
    local.get 2
    return)
  (func $__rust_alloc (type 3) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    call $__rdl_alloc
    local.set 2
    local.get 2
    return)
  (func $__rust_dealloc (type 7) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $__rdl_dealloc
    return)
  (func $__rust_realloc (type 9) (param i32 i32 i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__rdl_realloc
    local.set 4
    local.get 4
    return)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h0392c58b36b5e65cE (type 2) (param i32) (result i64)
    i64.const -3452326882552253247)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h8ccad713f7bee105E (type 2) (param i32) (result i64)
    i64.const 9147559743429524724)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hf6b487e2f110a1d5E (type 2) (param i32) (result i64)
    i64.const 943913013690912652)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h4473b65edfd7c202E (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.load
    local.tee 0
    i32.load offset=8
    local.set 3
    local.get 0
    i32.load
    local.set 0
    local.get 2
    local.get 1
    call $_ZN4core3fmt9Formatter10debug_list17haf359c45ea555102E
    block  ;; label = @1
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 2
        local.get 0
        i32.store offset=12
        local.get 2
        local.get 2
        i32.const 12
        i32.add
        i32.const 1048704
        call $_ZN4core3fmt8builders8DebugSet5entry17hcec6345aa501ef45E
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 3
        i32.const -1
        i32.add
        local.tee 3
        br_if 0 (;@2;)
      end
    end
    local.get 2
    call $_ZN4core3fmt8builders9DebugList6finish17hbd08192effc20d79E
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func $_ZN73_$LT$std..sys_common..os_str_bytes..Slice$u20$as$u20$core..fmt..Debug$GT$3fmt17h51daa603ac20d4e8E (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get 0
    i32.const 80
    i32.sub
    local.tee 3
    global.set 0
    i32.const 1
    local.set 4
    block  ;; label = @1
      local.get 2
      i32.const 1049652
      i32.const 1
      call $_ZN4core3fmt9Formatter9write_str17h545f61f492283d6dE
      br_if 0 (;@1;)
      local.get 3
      i32.const 8
      i32.add
      local.get 0
      local.get 1
      call $_ZN4core3str5lossy9Utf8Lossy10from_bytes17ha2425d52cb87229aE
      local.get 3
      local.get 3
      i32.load offset=8
      local.get 3
      i32.load offset=12
      call $_ZN4core3str5lossy9Utf8Lossy6chunks17h8921da9536869963E
      local.get 3
      local.get 3
      i64.load
      i64.store offset=16
      local.get 3
      i32.const 40
      i32.add
      local.get 3
      i32.const 16
      i32.add
      call $_ZN96_$LT$core..str..lossy..Utf8LossyChunksIter$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h98d561145d1e4712E
      block  ;; label = @2
        local.get 3
        i32.load offset=40
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.const 48
        i32.add
        local.set 5
        local.get 3
        i32.const 64
        i32.add
        local.set 6
        loop  ;; label = @3
          local.get 3
          i32.load offset=52
          local.set 7
          local.get 3
          i32.load offset=48
          local.set 8
          local.get 3
          i32.load offset=44
          local.set 0
          local.get 3
          i32.const 4
          i32.store offset=64
          local.get 3
          i32.const 4
          i32.store offset=48
          local.get 3
          local.get 4
          i32.store offset=40
          local.get 3
          local.get 4
          local.get 0
          i32.add
          i32.store offset=44
          i32.const 4
          local.set 4
          block  ;; label = @4
            loop  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        local.get 4
                                        i32.const 4
                                        i32.eq
                                        br_if 0 (;@18;)
                                        local.get 5
                                        call $_ZN82_$LT$core..char..EscapeDebug$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h1b10a0b08a976a19E
                                        local.tee 4
                                        i32.const 1114112
                                        i32.ne
                                        br_if 1 (;@17;)
                                        local.get 3
                                        i32.const 4
                                        i32.store offset=48
                                      end
                                      block  ;; label = @18
                                        local.get 3
                                        i32.load offset=44
                                        local.tee 0
                                        local.get 3
                                        i32.load offset=40
                                        local.tee 4
                                        i32.eq
                                        br_if 0 (;@18;)
                                        local.get 3
                                        local.get 4
                                        i32.const 1
                                        i32.add
                                        local.tee 9
                                        i32.store offset=40
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            local.get 4
                                            i32.load8_s
                                            local.tee 1
                                            i32.const -1
                                            i32.le_s
                                            br_if 0 (;@20;)
                                            local.get 1
                                            i32.const 255
                                            i32.and
                                            local.set 0
                                            br 1 (;@19;)
                                          end
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              local.get 9
                                              local.get 0
                                              i32.ne
                                              br_if 0 (;@21;)
                                              i32.const 0
                                              local.set 4
                                              local.get 0
                                              local.set 9
                                              br 1 (;@20;)
                                            end
                                            local.get 3
                                            local.get 4
                                            i32.const 2
                                            i32.add
                                            local.tee 9
                                            i32.store offset=40
                                            local.get 4
                                            i32.load8_u offset=1
                                            i32.const 63
                                            i32.and
                                            local.set 4
                                          end
                                          local.get 1
                                          i32.const 31
                                          i32.and
                                          local.set 10
                                          block  ;; label = @20
                                            local.get 1
                                            i32.const 255
                                            i32.and
                                            local.tee 1
                                            i32.const 223
                                            i32.gt_u
                                            br_if 0 (;@20;)
                                            local.get 4
                                            local.get 10
                                            i32.const 6
                                            i32.shl
                                            i32.or
                                            local.set 0
                                            br 1 (;@19;)
                                          end
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              local.get 9
                                              local.get 0
                                              i32.ne
                                              br_if 0 (;@21;)
                                              i32.const 0
                                              local.set 9
                                              local.get 0
                                              local.set 11
                                              br 1 (;@20;)
                                            end
                                            local.get 3
                                            local.get 9
                                            i32.const 1
                                            i32.add
                                            local.tee 11
                                            i32.store offset=40
                                            local.get 9
                                            i32.load8_u
                                            i32.const 63
                                            i32.and
                                            local.set 9
                                          end
                                          local.get 9
                                          local.get 4
                                          i32.const 6
                                          i32.shl
                                          i32.or
                                          local.set 4
                                          block  ;; label = @20
                                            local.get 1
                                            i32.const 240
                                            i32.ge_u
                                            br_if 0 (;@20;)
                                            local.get 4
                                            local.get 10
                                            i32.const 12
                                            i32.shl
                                            i32.or
                                            local.set 0
                                            br 1 (;@19;)
                                          end
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              local.get 11
                                              local.get 0
                                              i32.ne
                                              br_if 0 (;@21;)
                                              i32.const 0
                                              local.set 0
                                              br 1 (;@20;)
                                            end
                                            local.get 3
                                            local.get 11
                                            i32.const 1
                                            i32.add
                                            i32.store offset=40
                                            local.get 11
                                            i32.load8_u
                                            i32.const 63
                                            i32.and
                                            local.set 0
                                          end
                                          local.get 4
                                          i32.const 6
                                          i32.shl
                                          local.get 10
                                          i32.const 18
                                          i32.shl
                                          i32.const 1835008
                                          i32.and
                                          i32.or
                                          local.get 0
                                          i32.or
                                          local.set 0
                                        end
                                        i32.const 2
                                        local.set 4
                                        local.get 0
                                        i32.const -9
                                        i32.add
                                        local.tee 9
                                        i32.const 30
                                        i32.le_u
                                        br_if 4 (;@14;)
                                        local.get 0
                                        i32.const 92
                                        i32.eq
                                        br_if 6 (;@12;)
                                        local.get 0
                                        i32.const 1114112
                                        i32.ne
                                        br_if 5 (;@13;)
                                      end
                                      local.get 3
                                      i32.load offset=64
                                      i32.const 4
                                      i32.eq
                                      br_if 1 (;@16;)
                                      local.get 6
                                      call $_ZN82_$LT$core..char..EscapeDebug$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h1b10a0b08a976a19E
                                      local.tee 4
                                      i32.const 1114112
                                      i32.eq
                                      br_if 1 (;@16;)
                                    end
                                    local.get 2
                                    local.get 4
                                    call $_ZN57_$LT$core..fmt..Formatter$u20$as$u20$core..fmt..Write$GT$10write_char17h10ad0684667415e1E
                                    br_if 1 (;@15;)
                                    local.get 3
                                    i32.load offset=48
                                    local.set 4
                                    br 11 (;@5;)
                                  end
                                  loop  ;; label = @16
                                    local.get 7
                                    i32.eqz
                                    br_if 12 (;@4;)
                                    local.get 3
                                    local.get 8
                                    i32.store offset=28
                                    local.get 3
                                    i32.const 1
                                    i32.store offset=60
                                    local.get 3
                                    i32.const 1
                                    i32.store offset=52
                                    local.get 3
                                    i32.const 1051200
                                    i32.store offset=48
                                    local.get 3
                                    i32.const 1
                                    i32.store offset=44
                                    local.get 3
                                    i32.const 1051192
                                    i32.store offset=40
                                    local.get 3
                                    i32.const 5
                                    i32.store offset=36
                                    local.get 7
                                    i32.const -1
                                    i32.add
                                    local.set 7
                                    local.get 8
                                    i32.const 1
                                    i32.add
                                    local.set 8
                                    local.get 3
                                    local.get 3
                                    i32.const 32
                                    i32.add
                                    i32.store offset=56
                                    local.get 3
                                    local.get 3
                                    i32.const 28
                                    i32.add
                                    i32.store offset=32
                                    local.get 2
                                    local.get 3
                                    i32.const 40
                                    i32.add
                                    call $_ZN4core3fmt9Formatter9write_fmt17hdee63efa69c306f6E
                                    i32.eqz
                                    br_if 0 (;@16;)
                                  end
                                end
                                i32.const 1
                                local.set 4
                                br 13 (;@1;)
                              end
                              i32.const 116
                              local.set 1
                              local.get 9
                              br_table 7 (;@6;) 5 (;@8;) 0 (;@13;) 0 (;@13;) 6 (;@7;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 1 (;@12;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 0 (;@13;) 1 (;@12;) 7 (;@6;)
                            end
                            block  ;; label = @13
                              local.get 0
                              call $_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4933ac236810a5b5E
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 1
                              i32.or
                              i32.clz
                              i32.const 2
                              i32.shr_u
                              i32.const 7
                              i32.xor
                              i64.extend_i32_u
                              i64.const 21474836480
                              i64.or
                              local.set 12
                              br 3 (;@10;)
                            end
                            i32.const 1
                            local.set 4
                            local.get 0
                            call $_ZN4core7unicode9printable12is_printable17h576ae3d8aaeb2915E
                            i32.eqz
                            br_if 1 (;@11;)
                          end
                          br 2 (;@9;)
                        end
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.clz
                        i32.const 2
                        i32.shr_u
                        i32.const 7
                        i32.xor
                        i64.extend_i32_u
                        i64.const 21474836480
                        i64.or
                        local.set 12
                      end
                      i32.const 3
                      local.set 4
                    end
                    local.get 0
                    local.set 1
                    br 2 (;@6;)
                  end
                  i32.const 110
                  local.set 1
                  br 1 (;@6;)
                end
                i32.const 114
                local.set 1
              end
              local.get 3
              local.get 12
              i64.store offset=56
              local.get 3
              local.get 1
              i32.store offset=52
              local.get 3
              local.get 4
              i32.store offset=48
              br 0 (;@5;)
            end
          end
          local.get 3
          i32.const 40
          i32.add
          local.get 3
          i32.const 16
          i32.add
          call $_ZN96_$LT$core..str..lossy..Utf8LossyChunksIter$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h98d561145d1e4712E
          local.get 3
          i32.load offset=40
          local.tee 4
          br_if 0 (;@3;)
        end
      end
      local.get 2
      i32.const 1049652
      i32.const 1
      call $_ZN4core3fmt9Formatter9write_str17h545f61f492283d6dE
      local.set 4
    end
    local.get 3
    i32.const 80
    i32.add
    global.set 0
    local.get 4)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h72010bc18c2c3871E (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.set 0
    block  ;; label = @1
      local.get 1
      call $_ZN4core3fmt9Formatter15debug_lower_hex17hce81659868cce5baE
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        call $_ZN4core3fmt9Formatter15debug_upper_hex17h19a78e2dfbd00c52E
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17he6ead8fc076aace0E
        return
      end
      local.get 0
      local.get 1
      call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17hf6dfd165e0a82f4aE
      return
    end
    local.get 0
    local.get 1
    call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h84435a511eccf523E)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h935565c54b9e7992E (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.set 0
    block  ;; label = @1
      local.get 1
      call $_ZN4core3fmt9Formatter15debug_lower_hex17hce81659868cce5baE
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        call $_ZN4core3fmt9Formatter15debug_upper_hex17h19a78e2dfbd00c52E
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17h9ace9957d1dfdd97E
        return
      end
      local.get 0
      local.get 1
      call $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i8$GT$3fmt17hf0602dfa1b51374aE
      return
    end
    local.get 0
    local.get 1
    call $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i8$GT$3fmt17h520fc9cf30ca6ce8E)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h3f42ebff8fc1778aE (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h0d142c565b9fed95E)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h52ad5ba400a1c0b2E (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_ZN60_$LT$core..panic..Location$u20$as$u20$core..fmt..Display$GT$3fmt17h37d828db1f545440E)
  (func $_ZN45_$LT$$RF$T$u20$as$u20$core..fmt..UpperHex$GT$3fmt17hb918cce28d9d0601E (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i8$GT$3fmt17hf0602dfa1b51374aE)
  (func $_ZN4core3fmt5Write10write_char17h5ee09af859d49745E (type 3) (param i32 i32) (result i32)
    (local i32 i32 i64 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 0
    i32.store offset=4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 2
            i32.const 4
            i32.add
            local.set 3
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=6
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=4
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=5
            i32.const 3
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=4
          local.get 2
          i32.const 4
          i32.add
          local.set 3
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=5
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=4
        local.get 2
        i32.const 4
        i32.add
        local.set 3
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=7
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 240
      i32.or
      i32.store8 offset=4
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=6
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=5
      i32.const 4
      local.set 1
    end
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i32.load
    local.get 3
    local.get 1
    call $_ZN3std2io5Write9write_all17h39d0435291d0ea60E
    i32.const 0
    local.set 1
    block  ;; label = @1
      local.get 2
      i32.load8_u offset=8
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      local.get 2
      i64.load offset=8
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          br_if 0 (;@3;)
          local.get 0
          i32.load8_u offset=4
          i32.const 2
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 0
        i32.const 8
        i32.add
        i32.load
        local.tee 1
        i32.load
        local.get 1
        i32.load offset=4
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 3
          i32.load offset=4
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load
          local.get 5
          local.get 3
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 0
        i32.load offset=8
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 4
      i64.store offset=4 align=4
      i32.const 1
      local.set 1
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN3std2io5Write9write_all17h39d0435291d0ea60E (type 4) (param i32 i32 i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 4
          local.get 3
          i32.store offset=12
          local.get 4
          local.get 2
          i32.store offset=8
          local.get 4
          i32.const 16
          i32.add
          i32.const 2
          local.get 4
          i32.const 8
          i32.add
          i32.const 1
          call $_ZN4wasi13lib_generated8fd_write17h88522743b3c41194E
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.load16_u offset=16
                i32.const 1
                i32.eq
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 4
                  i32.load offset=20
                  local.tee 5
                  br_if 0 (;@7;)
                  local.get 4
                  i32.const 16
                  i32.add
                  i32.const 14
                  i32.const 1050340
                  i32.const 28
                  call $_ZN3std2io5error5Error3new17h241fae668dc94904E
                  local.get 0
                  local.get 4
                  i64.load offset=16
                  i64.store align=4
                  br 6 (;@1;)
                end
                local.get 3
                local.get 5
                i32.lt_u
                br_if 1 (;@5;)
                local.get 2
                local.get 5
                i32.add
                local.set 2
                local.get 3
                local.get 5
                i32.sub
                local.set 3
                br 2 (;@4;)
              end
              local.get 4
              local.get 4
              i32.load16_u offset=18
              i32.store16 offset=30
              local.get 4
              i32.const 30
              i32.add
              call $_ZN4wasi5error5Error9raw_error17hf4fc4403a50dba6eE
              i32.const 65535
              i32.and
              local.tee 5
              call $_ZN3std3sys4wasi17decode_error_kind17h0a01760857e06c9eE
              i32.const 255
              i32.and
              i32.const 15
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              i32.const 0
              i32.store
              local.get 0
              i32.const 4
              i32.add
              local.get 5
              i32.store
              br 4 (;@1;)
            end
            local.get 5
            local.get 3
            i32.const 1050544
            call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
            unreachable
          end
          local.get 3
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.const 3
      i32.store8
    end
    local.get 4
    i32.const 32
    i32.add
    global.set 0)
  (func $_ZN3std2io5error5Error3new17h241fae668dc94904E (type 4) (param i32 i32 i32 i32)
    (local i32 i32 i32 i64)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const -1
            i32.le_s
            br_if 0 (;@4;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                br_if 0 (;@6;)
                i32.const 1
                local.set 5
                i32.const 0
                local.set 6
                br 1 (;@5;)
              end
              local.get 3
              local.set 6
              local.get 3
              i32.const 1
              call $__rust_alloc
              local.tee 5
              i32.eqz
              br_if 2 (;@3;)
            end
            local.get 4
            i32.const 0
            i32.store offset=24
            local.get 4
            local.get 5
            i32.store offset=16
            local.get 4
            local.get 6
            i32.store offset=20
            local.get 4
            i32.const 16
            i32.add
            local.get 3
            call $_ZN5alloc3vec12Vec$LT$T$GT$7reserve17heda78ba2e93e6ddbE
            local.get 4
            i32.load offset=16
            local.get 4
            i32.load offset=24
            local.tee 5
            i32.add
            local.get 2
            local.get 3
            call $memcpy
            drop
            local.get 4
            i32.const 8
            i32.add
            local.get 5
            local.get 3
            i32.add
            local.tee 3
            i32.store
            local.get 4
            local.get 3
            i32.store offset=24
            local.get 4
            local.get 4
            i64.load offset=16
            local.tee 7
            i64.store
            local.get 4
            i32.const 16
            i32.add
            i32.const 8
            i32.add
            local.tee 5
            local.get 3
            i32.store
            local.get 4
            local.get 7
            i64.store offset=16
            i32.const 12
            i32.const 4
            call $__rust_alloc
            local.tee 2
            i32.eqz
            br_if 2 (;@2;)
            local.get 2
            local.get 4
            i64.load offset=16
            i64.store align=4
            local.get 2
            i32.const 8
            i32.add
            local.get 5
            i32.load
            i32.store
            i32.const 12
            i32.const 4
            call $__rust_alloc
            local.tee 3
            i32.eqz
            br_if 3 (;@1;)
            local.get 3
            local.get 1
            i32.store8 offset=8
            local.get 3
            i32.const 1049756
            i32.store offset=4
            local.get 3
            local.get 2
            i32.store
            local.get 3
            local.get 4
            i32.load16_u offset=16 align=1
            i32.store16 offset=9 align=1
            local.get 3
            i32.const 11
            i32.add
            local.get 4
            i32.const 16
            i32.add
            i32.const 2
            i32.add
            local.tee 2
            i32.load8_u
            i32.store8
            local.get 0
            i32.const 2
            i32.store8
            local.get 0
            local.get 4
            i32.load16_u offset=16 align=1
            i32.store16 offset=1 align=1
            local.get 0
            i32.const 3
            i32.add
            local.get 2
            i32.load8_u
            i32.store8
            local.get 0
            i32.const 4
            i32.add
            local.get 3
            i32.store
            local.get 4
            i32.const 32
            i32.add
            global.set 0
            return
          end
          call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h00a2a19d2e670c1eE
          unreachable
        end
        local.get 3
        i32.const 1
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h1ab5c239c842986eE
        unreachable
      end
      i32.const 12
      i32.const 4
      call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
      unreachable
    end
    i32.const 12
    i32.const 4
    call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
    unreachable)
  (func $_ZN4core3fmt5Write10write_char17hb53f5ebecc3ea1e8E (type 3) (param i32 i32) (result i32)
    (local i32 i32 i64 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 0
    i32.store offset=4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 2
            i32.const 4
            i32.add
            local.set 3
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=6
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=4
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=5
            i32.const 3
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=4
          local.get 2
          i32.const 4
          i32.add
          local.set 3
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=5
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=4
        local.get 2
        i32.const 4
        i32.add
        local.set 3
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=7
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 240
      i32.or
      i32.store8 offset=4
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=6
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=5
      i32.const 4
      local.set 1
    end
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i32.load
    local.get 3
    local.get 1
    call $_ZN3std2io5Write9write_all17hb4b7128eb566cce6E
    i32.const 0
    local.set 1
    block  ;; label = @1
      local.get 2
      i32.load8_u offset=8
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      local.get 2
      i64.load offset=8
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          br_if 0 (;@3;)
          local.get 0
          i32.load8_u offset=4
          i32.const 2
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 0
        i32.const 8
        i32.add
        i32.load
        local.tee 1
        i32.load
        local.get 1
        i32.load offset=4
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 3
          i32.load offset=4
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load
          local.get 5
          local.get 3
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 0
        i32.load offset=8
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 4
      i64.store offset=4 align=4
      i32.const 1
      local.set 1
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN3std2io5Write9write_all17hb4b7128eb566cce6E (type 4) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 4
            i32.const 8
            i32.add
            local.get 1
            local.get 2
            local.get 3
            call $_ZN61_$LT$std..io..stdio..StdoutLock$u20$as$u20$std..io..Write$GT$5write17h318ff9a8d34e94bcE
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.load offset=8
                i32.const 1
                i32.eq
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 4
                  i32.load offset=12
                  local.tee 5
                  br_if 0 (;@7;)
                  local.get 4
                  i32.const 24
                  i32.add
                  i32.const 14
                  i32.const 1050340
                  i32.const 28
                  call $_ZN3std2io5error5Error3new17h241fae668dc94904E
                  local.get 0
                  local.get 4
                  i64.load offset=24
                  i64.store align=4
                  br 6 (;@1;)
                end
                local.get 3
                local.get 5
                i32.lt_u
                br_if 4 (;@2;)
                local.get 2
                local.get 5
                i32.add
                local.set 2
                local.get 3
                local.get 5
                i32.sub
                local.set 3
                br 1 (;@5;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 4
                      i32.load8_u offset=12
                      local.tee 6
                      br_table 1 (;@8;) 0 (;@9;) 2 (;@7;) 1 (;@8;)
                    end
                    local.get 4
                    i32.load8_u offset=13
                    local.set 5
                    br 2 (;@6;)
                  end
                  local.get 4
                  i32.load offset=16
                  call $_ZN3std3sys4wasi17decode_error_kind17h0a01760857e06c9eE
                  i32.const 255
                  i32.and
                  local.set 5
                  br 1 (;@6;)
                end
                local.get 4
                i32.load offset=16
                i32.load8_u offset=8
                local.set 5
              end
              block  ;; label = @6
                local.get 5
                i32.const 255
                i32.and
                i32.const 15
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                local.get 4
                i64.load offset=12 align=4
                i64.store align=4
                br 5 (;@1;)
              end
              local.get 6
              i32.const 2
              i32.lt_u
              br_if 0 (;@5;)
              local.get 4
              i32.load offset=16
              local.tee 5
              i32.load
              local.get 5
              i32.load offset=4
              i32.load
              call_indirect (type 1)
              block  ;; label = @6
                local.get 5
                i32.load offset=4
                local.tee 6
                i32.load offset=4
                local.tee 7
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                i32.load
                local.get 7
                local.get 6
                i32.load offset=8
                call $__rust_dealloc
              end
              local.get 5
              i32.const 12
              i32.const 4
              call $__rust_dealloc
            end
            local.get 3
            br_if 0 (;@4;)
          end
        end
        local.get 0
        i32.const 3
        i32.store8
        br 1 (;@1;)
      end
      local.get 5
      local.get 3
      i32.const 1050544
      call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
      unreachable
    end
    local.get 4
    i32.const 32
    i32.add
    global.set 0)
  (func $_ZN4core3fmt5Write9write_fmt17h742453284fe8e52bE (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048632
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17hf78275652148e08fE
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN4core3fmt5Write9write_fmt17h76d12290e419169eE (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048656
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17hf78275652148e08fE
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN3std9panicking12default_hook17h98793b832cd2dab6E (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i64 i32)
    global.get 0
    i32.const 96
    i32.sub
    local.tee 1
    global.set 0
    i32.const 1
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1058352
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          i32.const 0
          i64.const 1
          i64.store offset=1058352
          br 1 (;@2;)
        end
        i32.const 0
        i32.load offset=1058356
        i32.const 1
        i32.gt_u
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        i32.const 0
        i32.load offset=1058284
        local.tee 2
        i32.const 2
        i32.le_u
        br_if 0 (;@2;)
        i32.const 1
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;) 0 (;@4;)
          end
          local.get 1
          i32.const 64
          i32.add
          i32.const 1049653
          i32.const 14
          call $_ZN3std3env7_var_os17he9875667788e1d16E
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load offset=64
              local.tee 3
              br_if 0 (;@5;)
              i32.const 5
              local.set 2
              br 1 (;@4;)
            end
            local.get 1
            i32.load offset=68
            local.set 4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.const 72
                i32.add
                i32.load
                i32.const -1
                i32.add
                local.tee 2
                i32.const 3
                i32.gt_u
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    br_table 0 (;@8;) 2 (;@6;) 2 (;@6;) 1 (;@7;) 0 (;@8;)
                  end
                  i32.const 4
                  local.set 2
                  i32.const 1
                  local.set 5
                  local.get 3
                  i32.const 1049667
                  i32.eq
                  br_if 2 (;@5;)
                  local.get 3
                  i32.load8_u
                  i32.const 48
                  i32.ne
                  br_if 1 (;@6;)
                  br 2 (;@5;)
                end
                i32.const 1
                local.set 2
                i32.const 3
                local.set 5
                local.get 3
                i32.const 1051176
                i32.eq
                br_if 1 (;@5;)
                local.get 3
                i32.load align=1
                i32.const 1819047270
                i32.eq
                br_if 1 (;@5;)
              end
              i32.const 0
              local.set 2
              i32.const 2
              local.set 5
            end
            local.get 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 4
            i32.const 1
            call $__rust_dealloc
          end
          i32.const 0
          i32.const 1
          local.get 5
          local.get 2
          i32.const 5
          i32.eq
          local.tee 3
          select
          i32.store offset=1058284
          i32.const 4
          local.get 2
          local.get 3
          select
          local.set 2
          br 2 (;@1;)
        end
        i32.const 4
        local.set 2
        br 1 (;@1;)
      end
      i32.const 0
      local.set 2
    end
    local.get 1
    local.get 2
    i32.store8 offset=35
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          call $_ZN4core5panic9PanicInfo8location17hd9842140c74e4b5aE
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 2
          i32.store offset=36
          local.get 1
          i32.const 24
          i32.add
          local.get 0
          call $_ZN4core5panic8Location4file17h51ec8de78a0a7533E
          local.get 1
          i32.load offset=24
          local.tee 2
          local.get 1
          i32.load offset=28
          i32.load offset=12
          call_indirect (type 2)
          local.set 6
          block  ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i64.const 9147559743429524724
            i64.eq
            br_if 2 (;@2;)
          end
          local.get 1
          i32.const 16
          i32.add
          local.get 0
          call $_ZN4core5panic8Location4file17h51ec8de78a0a7533E
          local.get 1
          i32.load offset=16
          local.tee 2
          local.get 1
          i32.load offset=20
          i32.load offset=12
          call_indirect (type 2)
          local.set 6
          i32.const 1051496
          local.set 5
          i32.const 8
          local.set 0
          block  ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i64.const 943913013690912652
            i64.ne
            br_if 0 (;@4;)
            local.get 2
            i32.load offset=8
            local.set 0
            local.get 2
            i32.load
            local.set 5
          end
          local.get 1
          local.get 5
          i32.store offset=40
          br 2 (;@1;)
        end
        i32.const 1049080
        i32.const 43
        i32.const 1051480
        call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
        unreachable
      end
      local.get 1
      local.get 2
      i32.load
      i32.store offset=40
      local.get 2
      i32.load offset=4
      local.set 0
    end
    local.get 1
    local.get 0
    i32.store offset=44
    i32.const 0
    local.set 0
    block  ;; label = @1
      i32.const 0
      i32.load offset=1058340
      i32.const 1
      i32.eq
      br_if 0 (;@1;)
      i32.const 0
      i64.const 1
      i64.store offset=1058340 align=4
      i32.const 0
      i32.const 0
      i32.store offset=1058348
    end
    local.get 1
    i32.const 1058344
    call $_ZN3std10sys_common11thread_info10ThreadInfo4with28_$u7b$$u7b$closure$u7d$$u7d$17hf9f457c8fb351805E
    local.tee 2
    i32.store offset=52
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.load offset=16
          local.tee 5
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        local.get 2
        i32.const 16
        i32.add
        i32.const 0
        local.get 5
        select
        local.tee 0
        i32.load offset=4
        local.tee 3
        i32.const -1
        i32.add
        local.set 5
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.set 0
      end
      local.get 1
      local.get 5
      i32.const 9
      local.get 0
      select
      i32.store offset=60
      local.get 1
      local.get 0
      i32.const 1051504
      local.get 0
      select
      i32.store offset=56
      local.get 1
      local.get 1
      i32.const 35
      i32.add
      i32.store offset=76
      local.get 1
      local.get 1
      i32.const 36
      i32.add
      i32.store offset=72
      local.get 1
      local.get 1
      i32.const 40
      i32.add
      i32.store offset=68
      local.get 1
      local.get 1
      i32.const 56
      i32.add
      i32.store offset=64
      i32.const 0
      local.set 3
      local.get 1
      i32.const 8
      i32.add
      i32.const 0
      local.get 1
      call $_ZN3std2io5stdio9set_panic17h7aca8b71dbb6c3c1E
      local.get 1
      i32.load offset=12
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load offset=8
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 5
          i32.store offset=84
          local.get 1
          local.get 0
          i32.store offset=80
          local.get 1
          i32.const 64
          i32.add
          local.get 1
          i32.const 80
          i32.add
          i32.const 1051560
          call $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h46401a881447bbf1E
          local.get 1
          local.get 1
          i32.load offset=80
          local.get 1
          i32.load offset=84
          call $_ZN3std2io5stdio9set_panic17h7aca8b71dbb6c3c1E
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 1
            i32.load offset=4
            local.tee 4
            i32.load
            call_indirect (type 1)
            local.get 4
            i32.load offset=4
            local.tee 7
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 7
            local.get 4
            i32.load offset=8
            call $__rust_dealloc
          end
          i32.const 1
          local.set 3
          br 1 (;@2;)
        end
        local.get 1
        i32.const 64
        i32.add
        local.get 1
        i32.const 88
        i32.add
        i32.const 1051516
        call $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h46401a881447bbf1E
      end
      local.get 2
      local.get 2
      i32.load
      local.tee 4
      i32.const -1
      i32.add
      i32.store
      block  ;; label = @2
        local.get 4
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.const 52
        i32.add
        call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h60f285450f6f3f75E
      end
      block  ;; label = @2
        local.get 0
        i32.const 0
        i32.ne
        local.get 3
        i32.const 1
        i32.xor
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 5
        i32.load
        call_indirect (type 1)
        local.get 5
        i32.load offset=4
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 2
        local.get 5
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 96
      i32.add
      global.set 0
      return
    end
    local.get 5
    i32.const 0
    i32.const 1049852
    call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
    unreachable)
  (func $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h0d04168c9cec80f1E (type 6) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.load
    i32.store offset=12
    local.get 2
    i32.const 12
    i32.add
    local.get 1
    call $_ZN3std4sync4once4Once9call_once28_$u7b$$u7b$closure$u7d$$u7d$17h1a740cc3bed420c0E
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func $_ZN3std4sync4once4Once9call_once28_$u7b$$u7b$closure$u7d$$u7d$17h1a740cc3bed420c0E (type 6) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load
    local.tee 0
    i32.load8_u
    local.set 2
    local.get 0
    i32.const 0
    i32.store8
    block  ;; label = @1
      local.get 2
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      local.set 3
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load8_u offset=1058361
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1058280
                local.set 4
                i32.const 0
                local.get 3
                i32.const 10
                i32.eq
                i32.store offset=1058280
                i32.const 0
                i32.const 0
                i32.store8 offset=1058361
                block  ;; label = @7
                  local.get 4
                  i32.const 1
                  i32.gt_u
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 4
                    br_table 5 (;@3;) 0 (;@8;) 5 (;@3;)
                  end
                  i32.const 1050948
                  i32.const 31
                  i32.const 1051016
                  call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
                  unreachable
                end
                local.get 4
                i32.load
                local.tee 5
                local.get 4
                i32.load offset=8
                local.tee 2
                i32.const 3
                i32.shl
                i32.add
                local.set 6
                local.get 4
                i32.load offset=4
                local.set 7
                local.get 5
                local.set 0
                local.get 2
                i32.eqz
                br_if 1 (;@5;)
                local.get 5
                local.set 0
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.load
                    local.tee 2
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 8
                    i32.add
                    local.set 0
                    br 3 (;@5;)
                  end
                  local.get 2
                  local.get 0
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 8
                  i32.load offset=12
                  call_indirect (type 1)
                  block  ;; label = @8
                    local.get 8
                    i32.load offset=4
                    local.tee 9
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 2
                    local.get 9
                    local.get 8
                    i32.load offset=8
                    call $__rust_dealloc
                  end
                  local.get 0
                  i32.const 8
                  i32.add
                  local.tee 0
                  local.get 6
                  i32.ne
                  br_if 0 (;@7;)
                  br 3 (;@4;)
                end
              end
              i32.const 1052192
              i32.const 32
              i32.const 1052260
              call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
              unreachable
            end
            local.get 6
            local.get 0
            i32.eq
            br_if 0 (;@4;)
            loop  ;; label = @5
              local.get 0
              i32.load
              local.get 0
              i32.const 4
              i32.add
              local.tee 2
              i32.load
              i32.load
              call_indirect (type 1)
              block  ;; label = @6
                local.get 2
                i32.load
                local.tee 2
                i32.load offset=4
                local.tee 8
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                i32.load
                local.get 8
                local.get 2
                i32.load offset=8
                call $__rust_dealloc
              end
              local.get 0
              i32.const 8
              i32.add
              local.tee 0
              local.get 6
              i32.ne
              br_if 0 (;@5;)
            end
          end
          block  ;; label = @4
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
            local.get 7
            i32.const 3
            i32.shl
            local.tee 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            local.get 0
            i32.const 4
            call $__rust_dealloc
          end
          local.get 4
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 3
        i32.const 9
        i32.gt_u
        local.set 0
        local.get 3
        i32.const 1
        i32.add
        i32.const 10
        local.get 3
        i32.const 10
        i32.lt_u
        select
        local.tee 2
        local.set 3
        local.get 2
        i32.const 11
        i32.lt_u
        local.get 0
        i32.const 1
        i32.xor
        i32.and
        br_if 0 (;@2;)
      end
      return
    end
    i32.const 1049080
    i32.const 43
    i32.const 1050764
    call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
    unreachable)
  (func $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h2ca61fe20b181ea6E (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        i32.const 1051180
        local.set 2
        i32.const 9
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.const 16
      i32.add
      local.get 2
      i32.load offset=4
      local.get 2
      i32.const 8
      i32.add
      i32.load
      call $_ZN4core3str9from_utf817h4147d06a7789f81eE
      i32.const 1051180
      local.get 3
      i32.load offset=20
      local.get 3
      i32.load offset=16
      i32.const 1
      i32.eq
      local.tee 4
      select
      local.set 2
      i32.const 9
      local.get 3
      i32.const 16
      i32.add
      i32.const 8
      i32.add
      i32.load
      local.get 4
      select
      local.set 4
    end
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    local.get 4
    call $_ZN4core3str5lossy9Utf8Lossy10from_bytes17ha2425d52cb87229aE
    local.get 3
    i32.load offset=8
    local.get 3
    i32.load offset=12
    local.get 1
    call $_ZN66_$LT$core..str..lossy..Utf8Lossy$u20$as$u20$core..fmt..Display$GT$3fmt17hb03f341134eb2e55E
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.const 1
      call $__rust_dealloc
    end
    local.get 3
    i32.const 32
    i32.add
    global.set 0
    local.get 2)
  (func $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17hc0ad29c3b7e3386dE (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store8 offset=4
      local.get 0
      i32.load
      local.set 1
      local.get 0
      i32.const 1
      i32.store
      local.get 1
      i32.load
      local.tee 0
      local.get 0
      i32.load
      local.tee 0
      i32.const -1
      i32.add
      i32.store
      block  ;; label = @2
        local.get 0
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h70f80a623fd3e456E
      end
      local.get 1
      i32.const 4
      i32.const 4
      call $__rust_dealloc
      return
    end
    i32.const 1052192
    i32.const 32
    i32.const 1052260
    call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
    unreachable)
  (func $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h70f80a623fd3e456E (type 1) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 2
      i32.load8_u offset=24
      i32.const 2
      i32.eq
      br_if 0 (;@1;)
      local.get 2
      i32.const 25
      i32.add
      i32.load8_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 8
      i32.add
      local.get 2
      i32.const 12
      i32.add
      call $_ZN3std2io8buffered18BufWriter$LT$W$GT$9flush_buf17h03fc67e5def2a023E
      block  ;; label = @2
        i32.const 0
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u offset=8
        i32.const 2
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load offset=12
      local.tee 3
      i32.load
      local.get 3
      i32.load offset=4
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 3
        i32.load offset=4
        local.tee 4
        i32.load offset=4
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load
        local.get 5
        local.get 4
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 3
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    block  ;; label = @1
      local.get 2
      i32.load offset=12
      local.tee 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 16
      i32.add
      i32.load
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 2
      i32.const 1
      call $__rust_dealloc
    end
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 2
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      local.get 2
      local.get 2
      i32.load offset=4
      local.tee 0
      i32.const -1
      i32.add
      i32.store offset=4
      local.get 0
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      i32.const 32
      i32.const 4
      call $__rust_dealloc
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE (type 7) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.const 8
    i32.add
    i32.const 1051820
    i32.const 0
    local.get 2
    call $_ZN4core5panic8Location6caller17hd41fba21c9b92f2bE
    call $_ZN3std9panicking20rust_panic_with_hook17hb404003726e52692E
    unreachable)
  (func $_ZN4core3ptr13drop_in_place17h02e69d70ceca204bE (type 1) (param i32))
  (func $_ZN4core3ptr13drop_in_place17h031a203171380296E (type 1) (param i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        br_if 0 (;@2;)
        local.get 0
        i32.load8_u offset=4
        i32.const 2
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 0
      i32.const 8
      i32.add
      i32.load
      local.tee 1
      i32.load
      local.get 1
      i32.load offset=4
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        local.tee 2
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load
        local.get 3
        local.get 2
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 0
      i32.load offset=8
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr13drop_in_place17h286c4e66fba3710aE (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr13drop_in_place17h2bbaf394966f4871E (type 1) (param i32)
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load offset=1058352
        i32.const 1
        i32.eq
        br_if 0 (;@2;)
        i32.const 0
        i64.const 1
        i64.store offset=1058352
        br 1 (;@1;)
      end
      i32.const 0
      i32.load offset=1058356
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      i32.const 1
      i32.store8 offset=4
    end
    local.get 0
    i32.load
    i32.load
    i32.const 0
    i32.store8)
  (func $_ZN4core3ptr13drop_in_place17ha21ac40875b3662cE (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 8
      i32.add
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr13drop_in_place17he50565616af5671aE (type 1) (param i32)
    (local i32 i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    i32.load
    call_indirect (type 1)
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.load offset=4
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.get 2
      local.get 1
      i32.load offset=8
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr13drop_in_place17hea2daf7bfbdfa5f6E (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr13drop_in_place17hf3262b356a2935b1E (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 8
      i32.add
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4core6option15Option$LT$T$GT$6unwrap17h710816bd9632510dE (type 5) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 1049080
      i32.const 43
      i32.const 1051768
      call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
      unreachable
    end
    local.get 0)
  (func $_ZN4core6option15Option$LT$T$GT$6unwrap17ha9b23444d02fba95E (type 3) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 1049080
      i32.const 43
      local.get 1
      call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
      unreachable
    end
    local.get 0)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2b6afd714e60244dE (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_ZN4core3fmt5Write10write_char17hb53f5ebecc3ea1e8E)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17hd4204762d830caa6E (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.load
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 2
            i32.const 12
            i32.add
            local.set 3
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=14
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 1
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=15
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 240
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 4
            local.set 1
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.const 4
            i32.add
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            i32.const 1
            call $_ZN5alloc3vec12Vec$LT$T$GT$7reserve17heda78ba2e93e6ddbE
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          i32.load
          local.get 3
          i32.add
          local.get 1
          i32.store8
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        local.get 2
        i32.const 12
        i32.add
        local.set 3
        i32.const 2
        local.set 1
      end
      local.get 0
      local.get 1
      call $_ZN5alloc3vec12Vec$LT$T$GT$7reserve17heda78ba2e93e6ddbE
      local.get 0
      i32.load
      local.get 0
      i32.const 8
      i32.add
      local.tee 0
      i32.load
      local.tee 4
      i32.add
      local.get 3
      local.get 1
      call $memcpy
      drop
      local.get 0
      local.get 4
      local.get 1
      i32.add
      i32.store
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    i32.const 0)
  (func $_ZN5alloc3vec12Vec$LT$T$GT$7reserve17heda78ba2e93e6ddbE (type 6) (param i32 i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 4
          i32.add
          i32.load
          local.tee 2
          local.get 0
          i32.load offset=8
          local.tee 3
          i32.sub
          local.get 1
          i32.ge_u
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.add
          local.tee 1
          local.get 3
          i32.lt_u
          br_if 1 (;@2;)
          local.get 2
          i32.const 1
          i32.shl
          local.tee 3
          local.get 1
          local.get 3
          local.get 1
          i32.gt_u
          select
          local.tee 1
          i32.const 8
          local.get 1
          i32.const 8
          i32.gt_u
          select
          local.tee 3
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load
              i32.const 0
              local.get 2
              select
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.get 3
              i32.eq
              br_if 1 (;@4;)
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                local.get 3
                i32.const 1
                call $__rust_alloc
                local.set 1
                br 2 (;@4;)
              end
              local.get 1
              local.get 2
              i32.const 1
              local.get 3
              call $__rust_realloc
              local.set 1
              br 1 (;@4;)
            end
            local.get 3
            i32.const 1
            call $__rust_alloc
            local.set 1
          end
          local.get 1
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.get 3
          i32.store
        end
        return
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17h232763bca8857af5E
      unreachable
    end
    local.get 3
    i32.const 1
    call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
    unreachable)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17hf61ed0efe1fa8f1aE (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_ZN4core3fmt5Write10write_char17h5ee09af859d49745E)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h424f8a87ef227754E (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.load
    i32.store offset=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048632
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17hf78275652148e08fE
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h7883bd689e386d70E (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.load
    i32.store offset=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048656
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17hf78275652148e08fE
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hf5f9ccb98e7f13b1E (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.load
    i32.store offset=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 4
    i32.add
    i32.const 1048680
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17hf78275652148e08fE
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h1d2341287c3c1530E (type 8) (param i32 i32 i32) (result i32)
    (local i32 i64 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    i32.load
    local.tee 0
    i32.load
    local.get 1
    local.get 2
    call $_ZN3std2io5Write9write_all17hb4b7128eb566cce6E
    i32.const 0
    local.set 1
    block  ;; label = @1
      local.get 3
      i32.load8_u offset=8
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      local.get 3
      i64.load offset=8
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          br_if 0 (;@3;)
          local.get 0
          i32.load8_u offset=4
          i32.const 2
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 0
        i32.const 8
        i32.add
        i32.load
        local.tee 1
        i32.load
        local.get 1
        i32.load offset=4
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 2
          i32.load offset=4
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load
          local.get 5
          local.get 2
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 0
        i32.load offset=8
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 4
      i64.store offset=4 align=4
      i32.const 1
      local.set 1
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h244888c2b6dd19d8E (type 8) (param i32 i32 i32) (result i32)
    (local i32 i64 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    i32.load
    local.tee 0
    i32.load
    local.get 1
    local.get 2
    call $_ZN3std2io5Write9write_all17h39d0435291d0ea60E
    i32.const 0
    local.set 1
    block  ;; label = @1
      local.get 3
      i32.load8_u offset=8
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      local.get 3
      i64.load offset=8
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          br_if 0 (;@3;)
          local.get 0
          i32.load8_u offset=4
          i32.const 2
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 0
        i32.const 8
        i32.add
        i32.load
        local.tee 1
        i32.load
        local.get 1
        i32.load offset=4
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 2
          i32.load offset=4
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load
          local.get 5
          local.get 2
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 0
        i32.load offset=8
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 4
      i64.store offset=4 align=4
      i32.const 1
      local.set 1
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17heec17b7d6bd2890dE (type 8) (param i32 i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.load
    local.tee 0
    local.get 2
    call $_ZN5alloc3vec12Vec$LT$T$GT$7reserve17heda78ba2e93e6ddbE
    local.get 0
    i32.load
    local.get 0
    i32.const 8
    i32.add
    local.tee 0
    i32.load
    local.tee 3
    i32.add
    local.get 1
    local.get 2
    call $memcpy
    drop
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store
    i32.const 0)
  (func $_ZN5alloc3vec12Vec$LT$T$GT$13reserve_exact17hfa748ba1b02fb699E (type 6) (param i32 i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 4
          i32.add
          i32.load
          local.tee 2
          local.get 0
          i32.load offset=8
          local.tee 3
          i32.sub
          local.get 1
          i32.ge_u
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.add
          local.tee 1
          local.get 3
          i32.lt_u
          br_if 1 (;@2;)
          local.get 1
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load
                i32.const 0
                local.get 2
                select
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                local.get 1
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 2
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 1
                    br_if 0 (;@8;)
                    i32.const 1
                    local.set 3
                    br 4 (;@4;)
                  end
                  local.get 1
                  i32.const 1
                  call $__rust_alloc
                  local.set 3
                  br 2 (;@5;)
                end
                local.get 3
                local.get 2
                i32.const 1
                local.get 1
                call $__rust_realloc
                local.set 3
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 1
                br_if 0 (;@6;)
                i32.const 1
                local.set 3
                br 2 (;@4;)
              end
              local.get 1
              i32.const 1
              call $__rust_alloc
              local.set 3
            end
            local.get 3
            i32.eqz
            br_if 3 (;@1;)
          end
          local.get 0
          local.get 3
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.get 1
          i32.store
        end
        return
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17h232763bca8857af5E
      unreachable
    end
    local.get 1
    i32.const 1
    call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
    unreachable)
  (func $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h60f285450f6f3f75E (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.load offset=16
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      i32.store8
      local.get 1
      i32.load offset=20
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=16
      local.get 2
      i32.const 1
      call $__rust_dealloc
    end
    local.get 1
    i32.load offset=28
    i32.const 1
    i32.const 1
    call $__rust_dealloc
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      local.get 1
      i32.load offset=4
      local.tee 0
      i32.const -1
      i32.add
      i32.store offset=4
      local.get 0
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.const 48
      i32.const 8
      call $__rust_dealloc
    end)
  (func $_ZN3std2io8buffered18BufWriter$LT$W$GT$9flush_buf17h03fc67e5def2a023E (type 6) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.const 3
    i32.store8
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 8
        i32.add
        local.tee 3
        i32.load
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              loop  ;; label = @6
                local.get 1
                i32.const 1
                i32.store8 offset=13
                local.get 1
                i32.load8_u offset=12
                local.tee 6
                i32.const 2
                i32.eq
                br_if 1 (;@5;)
                local.get 3
                i32.load
                local.tee 7
                local.get 5
                i32.lt_u
                br_if 2 (;@4;)
                local.get 7
                local.get 5
                i32.sub
                local.set 7
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 6
                    i32.const 1
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 1
                    i32.load
                    local.set 6
                    local.get 2
                    local.get 7
                    i32.store offset=12
                    local.get 2
                    local.get 6
                    local.get 5
                    i32.add
                    i32.store offset=8
                    local.get 2
                    i32.const 16
                    i32.add
                    i32.const 1
                    local.get 2
                    i32.const 8
                    i32.add
                    i32.const 1
                    call $_ZN4wasi13lib_generated8fd_write17h88522743b3c41194E
                    block  ;; label = @9
                      local.get 2
                      i32.load16_u offset=16
                      i32.const 1
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 2
                      local.get 2
                      i32.load16_u offset=18
                      i32.store16 offset=30
                      local.get 2
                      i32.const 30
                      i32.add
                      call $_ZN4wasi5error5Error9raw_error17hf4fc4403a50dba6eE
                      i32.const 65535
                      i32.and
                      local.tee 6
                      i32.const 8
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 1
                      i32.const 0
                      i32.store8 offset=13
                      local.get 6
                      call $_ZN3std3sys4wasi17decode_error_kind17h0a01760857e06c9eE
                      i32.const 255
                      i32.and
                      i32.const 15
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 0
                      i32.const 0
                      i32.store
                      local.get 0
                      i32.const 4
                      i32.add
                      local.get 6
                      i32.store
                      br 6 (;@3;)
                    end
                    local.get 2
                    i32.load offset=20
                    local.set 7
                  end
                  local.get 1
                  i32.const 0
                  i32.store8 offset=13
                  block  ;; label = @8
                    local.get 7
                    br_if 0 (;@8;)
                    local.get 2
                    i32.const 16
                    i32.add
                    i32.const 14
                    i32.const 1049928
                    i32.const 33
                    call $_ZN3std2io5error5Error3new17h241fae668dc94904E
                    local.get 0
                    local.get 2
                    i64.load offset=16
                    i64.store align=4
                    br 5 (;@3;)
                  end
                  local.get 7
                  local.get 5
                  i32.add
                  local.set 5
                end
                local.get 5
                local.get 4
                i32.lt_u
                br_if 0 (;@6;)
                br 3 (;@3;)
              end
            end
            i32.const 1049080
            i32.const 43
            i32.const 1049896
            call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
            unreachable
          end
          local.get 5
          local.get 7
          i32.const 1049912
          call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
          unreachable
        end
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 8
        i32.add
        local.tee 7
        i32.load
        local.tee 6
        local.get 5
        i32.lt_u
        br_if 1 (;@1;)
        local.get 7
        i32.const 0
        i32.store
        local.get 6
        local.get 5
        i32.sub
        local.tee 7
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load
        local.tee 6
        local.get 6
        local.get 5
        i32.add
        local.get 7
        call $memmove
        drop
        local.get 1
        i32.const 8
        i32.add
        local.get 7
        i32.store
      end
      local.get 2
      i32.const 32
      i32.add
      global.set 0
      return
    end
    local.get 5
    local.get 6
    call $_ZN5alloc3vec12Vec$LT$T$GT$5drain17end_assert_failed17h686d263f81d07b88E
    unreachable)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h00a2a19d2e670c1eE (type 0)
    call $_ZN5alloc7raw_vec17capacity_overflow17h232763bca8857af5E
    unreachable)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h1ab5c239c842986eE (type 6) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
    unreachable)
  (func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17h70c46c42c25c7b72E (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h0d142c565b9fed95E)
  (func $_ZN3std10sys_common11thread_info10ThreadInfo4with28_$u7b$$u7b$closure$u7d$$u7d$17hf9f457c8fb351805E (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load
            local.tee 2
            i32.const 1
            i32.add
            i32.const 0
            i32.le_s
            br_if 0 (;@4;)
            local.get 0
            local.get 2
            i32.store
            block  ;; label = @5
              local.get 0
              i32.load offset=4
              local.tee 3
              br_if 0 (;@5;)
              local.get 1
              i32.const 0
              i32.store offset=8
              local.get 1
              i32.const 8
              i32.add
              call $_ZN3std6thread6Thread3new17hcdd908459063ea43E
              local.set 3
              local.get 0
              i32.load
              br_if 2 (;@3;)
              local.get 0
              i32.const -1
              i32.store
              block  ;; label = @6
                local.get 0
                i32.load offset=4
                local.tee 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                local.get 2
                i32.load
                local.tee 4
                i32.const -1
                i32.add
                i32.store
                local.get 4
                i32.const 1
                i32.ne
                br_if 0 (;@6;)
                local.get 0
                i32.const 4
                i32.add
                call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h60f285450f6f3f75E
              end
              local.get 0
              local.get 3
              i32.store offset=4
              local.get 0
              local.get 0
              i32.load
              i32.const 1
              i32.add
              local.tee 2
              i32.store
            end
            local.get 2
            br_if 2 (;@2;)
            local.get 0
            i32.const -1
            i32.store
            local.get 3
            local.get 3
            i32.load
            local.tee 2
            i32.const 1
            i32.add
            i32.store
            local.get 2
            i32.const -1
            i32.le_s
            br_if 3 (;@1;)
            local.get 0
            local.get 0
            i32.load
            i32.const 1
            i32.add
            i32.store
            local.get 1
            i32.const 32
            i32.add
            global.set 0
            local.get 3
            return
          end
          i32.const 1048912
          i32.const 24
          local.get 1
          i32.const 24
          i32.add
          i32.const 1049124
          i32.const 1048936
          call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
          unreachable
        end
        i32.const 1048812
        i32.const 16
        local.get 1
        i32.const 24
        i32.add
        i32.const 1049140
        i32.const 1048896
        call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
        unreachable
      end
      i32.const 1048812
      i32.const 16
      local.get 1
      i32.const 24
      i32.add
      i32.const 1049140
      i32.const 1048896
      call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
      unreachable
    end
    unreachable
    unreachable)
  (func $_ZN3std6thread4park17h939424159e238725E (type 0)
    (local i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 96
    i32.sub
    local.tee 0
    global.set 0
    block  ;; label = @1
      i32.const 0
      i32.load offset=1058340
      i32.const 1
      i32.eq
      br_if 0 (;@1;)
      i32.const 0
      i64.const 1
      i64.store offset=1058340 align=4
      i32.const 0
      i32.const 0
      i32.store offset=1058348
    end
    i32.const 1058344
    call $_ZN3std10sys_common11thread_info10ThreadInfo4with28_$u7b$$u7b$closure$u7d$$u7d$17hf9f457c8fb351805E
    local.tee 1
    i32.const 0
    local.get 1
    i32.load offset=24
    local.tee 2
    local.get 2
    i32.const 2
    i32.eq
    local.tee 2
    select
    i32.store offset=24
    local.get 0
    local.get 1
    i32.store offset=8
    block  ;; label = @1
      local.get 2
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=8
              local.tee 1
              i32.const 28
              i32.add
              local.tee 3
              i32.load
              local.tee 2
              i32.load8_u
              br_if 0 (;@5;)
              local.get 2
              i32.const 1
              i32.store8
              i32.const 0
              local.set 4
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1058352
                  i32.const 1
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.load offset=1058356
                  local.set 4
                  br 1 (;@6;)
                end
                i32.const 0
                i64.const 1
                i64.store offset=1058352
              end
              i32.const 0
              local.get 4
              i32.store offset=1058356
              local.get 1
              i32.load8_u offset=32
              br_if 1 (;@4;)
              local.get 1
              local.get 1
              i32.load offset=24
              local.tee 2
              i32.const 1
              local.get 2
              select
              i32.store offset=24
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                local.get 0
                i32.load offset=8
                i32.const 36
                i32.add
                local.get 3
                i32.load
                call $_ZN3std4sync7condvar7Condvar6verify17h7fb2a623225b9b55E
                call $_ZN3std10sys_common7condvar7Condvar4wait17he75a7ac734aeedb4E
                unreachable
              end
              local.get 2
              i32.const 2
              i32.ne
              br_if 2 (;@3;)
              local.get 0
              i32.load offset=8
              local.tee 5
              i32.load offset=24
              local.set 2
              local.get 5
              i32.const 0
              i32.store offset=24
              local.get 0
              local.get 2
              i32.store offset=12
              local.get 2
              i32.const 2
              i32.ne
              br_if 3 (;@2;)
              block  ;; label = @6
                local.get 4
                br_if 0 (;@6;)
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1058352
                  i32.const 1
                  i32.eq
                  br_if 0 (;@7;)
                  i32.const 0
                  i64.const 1
                  i64.store offset=1058352
                  br 1 (;@6;)
                end
                i32.const 0
                i32.load offset=1058356
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                i32.const 1
                i32.store8 offset=32
              end
              local.get 3
              i32.load
              i32.const 0
              i32.store8
              br 4 (;@1;)
            end
            i32.const 1052192
            i32.const 32
            i32.const 1052260
            call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
            unreachable
          end
          local.get 0
          local.get 3
          i32.store offset=72
          local.get 0
          local.get 4
          i32.const 0
          i32.ne
          i32.store8 offset=76
          i32.const 1049172
          i32.const 43
          local.get 0
          i32.const 72
          i32.add
          i32.const 1049232
          i32.const 1049324
          call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
          unreachable
        end
        i32.const 1049340
        i32.const 23
        i32.const 1049364
        call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
        unreachable
      end
      local.get 0
      i32.const 40
      i32.add
      i32.const 20
      i32.add
      i32.const 6
      i32.store
      local.get 0
      i32.const 52
      i32.add
      i32.const 7
      i32.store
      local.get 0
      i32.const 16
      i32.add
      i32.const 20
      i32.add
      i32.const 3
      i32.store
      local.get 0
      local.get 0
      i32.const 12
      i32.add
      i32.store offset=64
      local.get 0
      i32.const 1049380
      i32.store offset=68
      local.get 0
      i32.const 72
      i32.add
      i32.const 20
      i32.add
      i32.const 0
      i32.store
      local.get 0
      i64.const 3
      i64.store offset=20 align=4
      local.get 0
      i32.const 1049056
      i32.store offset=16
      local.get 0
      i32.const 7
      i32.store offset=44
      local.get 0
      i32.const 1049036
      i32.store offset=88
      local.get 0
      i64.const 1
      i64.store offset=76 align=4
      local.get 0
      i32.const 1049416
      i32.store offset=72
      local.get 0
      local.get 0
      i32.const 40
      i32.add
      i32.store offset=32
      local.get 0
      local.get 0
      i32.const 72
      i32.add
      i32.store offset=56
      local.get 0
      local.get 0
      i32.const 68
      i32.add
      i32.store offset=48
      local.get 0
      local.get 0
      i32.const 64
      i32.add
      i32.store offset=40
      local.get 0
      i32.const 16
      i32.add
      i32.const 1049424
      call $_ZN3std9panicking15begin_panic_fmt17h08429981da95e9e5E
      unreachable
    end
    local.get 0
    i32.load offset=8
    local.tee 1
    local.get 1
    i32.load
    local.tee 1
    i32.const -1
    i32.add
    i32.store
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 8
      i32.add
      call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h60f285450f6f3f75E
    end
    local.get 0
    i32.const 96
    i32.add
    global.set 0)
  (func $_ZN3std4sync7condvar7Condvar6verify17h7fb2a623225b9b55E (type 6) (param i32 i32)
    (local i32)
    local.get 0
    local.get 0
    i32.load offset=4
    local.tee 2
    local.get 1
    local.get 2
    select
    i32.store offset=4
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      i32.const 1050624
      i32.const 54
      i32.const 1050704
      call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
      unreachable
    end)
  (func $_ZN3std10sys_common7condvar7Condvar4wait17he75a7ac734aeedb4E (type 0)
    (local i32)
    local.get 0
    local.get 0
    call $_ZN3std3sys4wasi7condvar7Condvar4wait17hd58c2e705c9c4c90E
    unreachable)
  (func $_ZN3std9panicking15begin_panic_fmt17h08429981da95e9e5E (type 6) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    call $_ZN4core5panic8Location6caller17hd41fba21c9b92f2bE
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    i32.const 1049036
    i32.store offset=4
    local.get 2
    i32.const 1049036
    i32.store
    local.get 2
    call $rust_begin_unwind
    unreachable)
  (func $_ZN3std6thread6Thread3new17hcdd908459063ea43E (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32 i64)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load
                local.tee 2
                br_if 0 (;@6;)
                i32.const 0
                local.set 3
                br 1 (;@5;)
              end
              local.get 1
              local.get 0
              i64.load offset=4 align=4
              i64.store offset=36 align=4
              local.get 1
              local.get 2
              i32.store offset=32
              local.get 1
              i32.const 16
              i32.add
              local.get 1
              i32.const 32
              i32.add
              call $_ZN5alloc6string104_$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..vec..Vec$LT$u8$GT$$GT$4from17h4fac04ba81ae9773E
              local.get 1
              i32.const 8
              i32.add
              i32.const 0
              local.get 1
              i32.load offset=16
              local.tee 0
              local.get 1
              i32.load offset=24
              call $_ZN4core5slice6memchr6memchr17h00efbe6d015a8522E
              local.get 1
              i32.load offset=8
              br_if 1 (;@4;)
              local.get 1
              i32.const 32
              i32.add
              i32.const 8
              i32.add
              local.get 1
              i32.const 16
              i32.add
              i32.const 8
              i32.add
              i32.load
              i32.store
              local.get 1
              local.get 1
              i64.load offset=16
              i64.store offset=32
              local.get 1
              local.get 1
              i32.const 32
              i32.add
              call $_ZN3std3ffi5c_str7CString18from_vec_unchecked17h1d6cb68d9855bba2E
              local.get 1
              i32.load offset=4
              local.set 4
              local.get 1
              i32.load
              local.set 3
            end
            i32.const 0
            i32.load8_u offset=1058360
            br_if 1 (;@3;)
            i32.const 0
            i32.const 1
            i32.store8 offset=1058360
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i64.load offset=1058256
                local.tee 5
                i64.const -1
                i64.eq
                br_if 0 (;@6;)
                i32.const 0
                local.get 5
                i64.const 1
                i64.add
                i64.store offset=1058256
                local.get 5
                i64.const 0
                i64.ne
                br_if 1 (;@5;)
                i32.const 1049080
                i32.const 43
                i32.const 1049512
                call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
                unreachable
              end
              i32.const 1049440
              i32.const 55
              i32.const 1049496
              call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
              unreachable
            end
            i32.const 0
            i32.const 0
            i32.store8 offset=1058360
            i32.const 1
            i32.const 1
            call $__rust_alloc
            local.tee 2
            i32.eqz
            br_if 2 (;@2;)
            local.get 2
            i32.const 0
            i32.store8
            i32.const 48
            i32.const 8
            call $__rust_alloc
            local.tee 0
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            i64.const 1
            i64.store offset=36 align=4
            local.get 0
            i32.const 0
            i32.store offset=24
            local.get 0
            local.get 4
            i32.store offset=20
            local.get 0
            local.get 3
            i32.store offset=16
            local.get 0
            local.get 5
            i64.store offset=8
            local.get 0
            i64.const 4294967297
            i64.store
            local.get 0
            local.get 2
            i64.extend_i32_u
            i64.store offset=28 align=4
            local.get 1
            i32.const 48
            i32.add
            global.set 0
            local.get 0
            return
          end
          local.get 1
          i32.load offset=12
          local.set 2
          local.get 1
          i32.const 40
          i32.add
          local.get 1
          i64.load offset=20 align=4
          i64.store
          local.get 1
          local.get 0
          i32.store offset=36
          local.get 1
          local.get 2
          i32.store offset=32
          i32.const 1049528
          i32.const 47
          local.get 1
          i32.const 32
          i32.add
          i32.const 1049156
          i32.const 1049576
          call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
          unreachable
        end
        i32.const 1052192
        i32.const 32
        i32.const 1052260
        call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
        unreachable
      end
      i32.const 1
      i32.const 1
      call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
      unreachable
    end
    i32.const 48
    i32.const 8
    call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
    unreachable)
  (func $_ZN3std3ffi5c_str7CString18from_vec_unchecked17h1d6cb68d9855bba2E (type 6) (param i32 i32)
    (local i32 i32 i32)
    local.get 1
    i32.const 1
    call $_ZN5alloc3vec12Vec$LT$T$GT$13reserve_exact17hfa748ba1b02fb699E
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      local.tee 3
      i32.load
      local.tee 4
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.const 1
      call $_ZN5alloc3vec12Vec$LT$T$GT$7reserve17heda78ba2e93e6ddbE
      local.get 3
      i32.load
      local.set 4
      local.get 1
      i32.load offset=8
      local.set 2
    end
    local.get 1
    local.get 2
    i32.const 1
    i32.add
    local.tee 3
    i32.store offset=8
    local.get 1
    i32.load
    local.tee 1
    local.get 2
    i32.add
    i32.const 0
    i32.store8
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        local.get 3
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          local.get 3
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          br_if 1 (;@2;)
          local.get 1
          local.set 2
          br 2 (;@1;)
        end
        i32.const 1049248
        i32.const 36
        i32.const 1048796
        call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
        unreachable
      end
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        i32.const 1
        local.set 2
        local.get 1
        local.get 4
        i32.const 1
        call $__rust_dealloc
        br 1 (;@1;)
      end
      local.get 1
      local.get 4
      i32.const 1
      local.get 3
      call $__rust_realloc
      local.tee 2
      br_if 0 (;@1;)
      local.get 3
      i32.const 1
      call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
      unreachable
    end
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func $_ZN3std3env7_var_os17he9875667788e1d16E (type 7) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i64)
    global.get 0
    i32.const 80
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 2
    i32.store offset=28
    local.get 3
    local.get 1
    i32.store offset=24
    i32.const 1
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 1
            i32.add
            local.tee 5
            i32.const -1
            i32.le_s
            br_if 0 (;@4;)
            i32.const 0
            local.set 6
            block  ;; label = @5
              local.get 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 5
              local.set 6
              local.get 5
              i32.const 1
              call $__rust_alloc
              local.tee 4
              i32.eqz
              br_if 2 (;@3;)
            end
            local.get 3
            i32.const 0
            i32.store offset=72
            local.get 3
            local.get 4
            i32.store offset=64
            local.get 3
            local.get 6
            i32.store offset=68
            local.get 3
            i32.const 64
            i32.add
            local.get 2
            call $_ZN5alloc3vec12Vec$LT$T$GT$7reserve17heda78ba2e93e6ddbE
            local.get 3
            i32.load offset=64
            local.tee 5
            local.get 3
            i32.load offset=72
            local.tee 4
            i32.add
            local.get 1
            local.get 2
            call $memcpy
            drop
            local.get 3
            local.get 4
            local.get 2
            i32.add
            local.tee 2
            i32.store offset=72
            local.get 3
            i32.const 16
            i32.add
            i32.const 0
            local.get 5
            local.get 2
            call $_ZN4core5slice6memchr6memchr17h00efbe6d015a8522E
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.load offset=16
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 40
                  i32.add
                  i32.const 8
                  i32.add
                  local.get 3
                  i32.const 64
                  i32.add
                  i32.const 8
                  i32.add
                  i32.load
                  i32.store
                  local.get 3
                  local.get 3
                  i64.load offset=64
                  i64.store offset=40
                  local.get 3
                  i32.const 8
                  i32.add
                  local.get 3
                  i32.const 40
                  i32.add
                  call $_ZN3std3ffi5c_str7CString18from_vec_unchecked17h1d6cb68d9855bba2E
                  local.get 3
                  i32.load offset=12
                  local.set 7
                  local.get 3
                  i32.load offset=8
                  local.tee 8
                  call $getenv
                  local.tee 6
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 2
                  br 2 (;@5;)
                end
                local.get 3
                i32.load offset=68
                local.set 2
                local.get 3
                i32.const 40
                i32.add
                i32.const 11
                i32.const 1049796
                i32.const 33
                call $_ZN3std2io5error5Error3new17h241fae668dc94904E
                block  ;; label = @7
                  local.get 2
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 5
                  local.get 2
                  i32.const 1
                  call $__rust_dealloc
                end
                local.get 3
                local.get 3
                i64.load offset=40
                i64.store offset=32
                local.get 3
                i32.const 60
                i32.add
                i32.const 2
                i32.store
                local.get 3
                i32.const 76
                i32.add
                i32.const 8
                i32.store
                local.get 3
                i64.const 2
                i64.store offset=44 align=4
                local.get 3
                i32.const 1049724
                i32.store offset=40
                local.get 3
                i32.const 9
                i32.store offset=68
                local.get 3
                local.get 3
                i32.const 64
                i32.add
                i32.store offset=56
                local.get 3
                local.get 3
                i32.const 32
                i32.add
                i32.store offset=72
                local.get 3
                local.get 3
                i32.const 24
                i32.add
                i32.store offset=64
                local.get 3
                i32.const 40
                i32.add
                i32.const 1049740
                call $_ZN3std9panicking15begin_panic_fmt17h08429981da95e9e5E
                unreachable
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 6
                    i32.load8_u
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const 1
                    i32.add
                    local.set 4
                    i32.const 0
                    local.set 2
                    loop  ;; label = @9
                      local.get 4
                      local.get 2
                      i32.add
                      local.set 5
                      local.get 2
                      i32.const 1
                      i32.add
                      local.tee 1
                      local.set 2
                      local.get 5
                      i32.load8_u
                      br_if 0 (;@9;)
                    end
                    local.get 1
                    i32.const -1
                    i32.eq
                    br_if 6 (;@2;)
                    local.get 1
                    i32.const -1
                    i32.le_s
                    br_if 4 (;@4;)
                    local.get 1
                    br_if 1 (;@7;)
                  end
                  i32.const 0
                  local.set 1
                  i32.const 1
                  local.set 2
                  br 1 (;@6;)
                end
                local.get 1
                i32.const 1
                call $__rust_alloc
                local.tee 2
                i32.eqz
                br_if 5 (;@1;)
              end
              local.get 3
              i32.const 0
              i32.store offset=48
              local.get 3
              local.get 2
              i32.store offset=40
              local.get 3
              local.get 1
              i32.store offset=44
              local.get 3
              i32.const 40
              i32.add
              local.get 1
              call $_ZN5alloc3vec12Vec$LT$T$GT$7reserve17heda78ba2e93e6ddbE
              local.get 3
              i32.load offset=40
              local.tee 2
              local.get 3
              i32.load offset=48
              local.tee 5
              i32.add
              local.get 6
              local.get 1
              call $memcpy
              drop
              local.get 3
              local.get 5
              local.get 1
              i32.add
              i32.store offset=48
              local.get 3
              i64.load offset=44 align=4
              local.set 9
            end
            local.get 8
            i32.const 0
            i32.store8
            block  ;; label = @5
              local.get 7
              i32.eqz
              br_if 0 (;@5;)
              local.get 8
              local.get 7
              i32.const 1
              call $__rust_dealloc
            end
            local.get 0
            local.get 9
            i64.store offset=4 align=4
            local.get 0
            local.get 2
            i32.store
            local.get 3
            i32.const 80
            i32.add
            global.set 0
            return
          end
          call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h00a2a19d2e670c1eE
          unreachable
        end
        local.get 5
        i32.const 1
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h1ab5c239c842986eE
        unreachable
      end
      local.get 1
      i32.const 0
      i32.const 1049852
      call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
      unreachable
    end
    local.get 1
    i32.const 1
    call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h1ab5c239c842986eE
    unreachable)
  (func $_ZN60_$LT$std..io..error..Error$u20$as$u20$core..fmt..Display$GT$3fmt17hb3ec362a48a590eeE (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            br_table 1 (;@3;) 0 (;@4;) 2 (;@2;) 1 (;@3;)
          end
          i32.const 1049996
          local.set 3
          i32.const 22
          local.set 4
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                local.get 0
                                                i32.load8_u offset=1
                                                br_table 0 (;@22;) 1 (;@21;) 2 (;@20;) 3 (;@19;) 4 (;@18;) 5 (;@17;) 6 (;@16;) 7 (;@15;) 8 (;@14;) 9 (;@13;) 10 (;@12;) 11 (;@11;) 12 (;@10;) 13 (;@9;) 14 (;@8;) 15 (;@7;) 16 (;@6;) 18 (;@4;) 0 (;@22;)
                                              end
                                              i32.const 1050277
                                              local.set 3
                                              i32.const 16
                                              local.set 4
                                              br 17 (;@4;)
                                            end
                                            i32.const 1050260
                                            local.set 3
                                            i32.const 17
                                            local.set 4
                                            br 16 (;@4;)
                                          end
                                          i32.const 1050242
                                          local.set 3
                                          i32.const 18
                                          local.set 4
                                          br 15 (;@4;)
                                        end
                                        i32.const 1050226
                                        local.set 3
                                        i32.const 16
                                        local.set 4
                                        br 14 (;@4;)
                                      end
                                      i32.const 1050208
                                      local.set 3
                                      i32.const 18
                                      local.set 4
                                      br 13 (;@4;)
                                    end
                                    i32.const 1050195
                                    local.set 3
                                    i32.const 13
                                    local.set 4
                                    br 12 (;@4;)
                                  end
                                  i32.const 1050181
                                  local.set 3
                                  br 10 (;@5;)
                                end
                                i32.const 1050160
                                local.set 3
                                i32.const 21
                                local.set 4
                                br 10 (;@4;)
                              end
                              i32.const 1050149
                              local.set 3
                              i32.const 11
                              local.set 4
                              br 9 (;@4;)
                            end
                            i32.const 1050128
                            local.set 3
                            i32.const 21
                            local.set 4
                            br 8 (;@4;)
                          end
                          i32.const 1050107
                          local.set 3
                          i32.const 21
                          local.set 4
                          br 7 (;@4;)
                        end
                        i32.const 1050084
                        local.set 3
                        i32.const 23
                        local.set 4
                        br 6 (;@4;)
                      end
                      i32.const 1050072
                      local.set 3
                      i32.const 12
                      local.set 4
                      br 5 (;@4;)
                    end
                    i32.const 1050063
                    local.set 3
                    i32.const 9
                    local.set 4
                    br 4 (;@4;)
                  end
                  i32.const 1050053
                  local.set 3
                  i32.const 10
                  local.set 4
                  br 3 (;@4;)
                end
                i32.const 1050032
                local.set 3
                i32.const 21
                local.set 4
                br 2 (;@4;)
              end
              i32.const 1050018
              local.set 3
            end
            i32.const 14
            local.set 4
          end
          local.get 2
          i32.const 60
          i32.add
          i32.const 1
          i32.store
          local.get 2
          local.get 4
          i32.store offset=28
          local.get 2
          local.get 3
          i32.store offset=24
          local.get 2
          i32.const 10
          i32.store offset=12
          local.get 2
          i64.const 1
          i64.store offset=44 align=4
          local.get 2
          i32.const 1050296
          i32.store offset=40
          local.get 2
          local.get 2
          i32.const 24
          i32.add
          i32.store offset=8
          local.get 2
          local.get 2
          i32.const 8
          i32.add
          i32.store offset=56
          local.get 1
          local.get 2
          i32.const 40
          i32.add
          call $_ZN4core3fmt9Formatter9write_fmt17hdee63efa69c306f6E
          local.set 0
          br 2 (;@1;)
        end
        local.get 2
        local.get 0
        i32.const 4
        i32.add
        i32.load
        local.tee 0
        i32.store offset=4
        local.get 2
        i32.const 8
        i32.add
        local.get 0
        call $_ZN3std3sys4wasi2os12error_string17hc9a4b2180ec6a096E
        local.get 2
        i32.const 60
        i32.add
        i32.const 2
        i32.store
        local.get 2
        i32.const 36
        i32.add
        i32.const 11
        i32.store
        local.get 2
        i64.const 3
        i64.store offset=44 align=4
        local.get 2
        i32.const 1050316
        i32.store offset=40
        local.get 2
        i32.const 12
        i32.store offset=28
        local.get 2
        local.get 2
        i32.const 24
        i32.add
        i32.store offset=56
        local.get 2
        local.get 2
        i32.const 4
        i32.add
        i32.store offset=32
        local.get 2
        local.get 2
        i32.const 8
        i32.add
        i32.store offset=24
        local.get 1
        local.get 2
        i32.const 40
        i32.add
        call $_ZN4core3fmt9Formatter9write_fmt17hdee63efa69c306f6E
        local.set 0
        local.get 2
        i32.load offset=8
        local.tee 1
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        i32.load offset=12
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 3
        i32.const 1
        call $__rust_dealloc
        br 1 (;@1;)
      end
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      local.get 1
      local.get 0
      i32.load offset=4
      i32.load offset=32
      call_indirect (type 3)
      local.set 0
    end
    local.get 2
    i32.const 64
    i32.add
    global.set 0
    local.get 0)
  (func $_ZN55_$LT$std..path..Display$u20$as$u20$core..fmt..Debug$GT$3fmt17h23d105d427099b82E (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.const 4
    i32.add
    i32.load
    local.get 1
    call $_ZN73_$LT$std..sys_common..os_str_bytes..Slice$u20$as$u20$core..fmt..Debug$GT$3fmt17h51daa603ac20d4e8E)
  (func $_ZN3std5error5Error7type_id17h2550ffb23e5e09dbE (type 2) (param i32) (result i64)
    i64.const -6756504174187499666)
  (func $_ZN3std5error5Error9backtrace17h900a267d2e29f61aE (type 5) (param i32) (result i32)
    i32.const 0)
  (func $_ZN3std5error5Error5cause17h940cb81d2ddff14fE (type 6) (param i32 i32)
    local.get 0
    i32.const 0
    i32.store)
  (func $_ZN243_$LT$std..error..$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..boxed..Box$LT$dyn$u20$std..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$..from..StringError$u20$as$u20$std..error..Error$GT$11description17hf458bce664dc3f4bE (type 6) (param i32 i32)
    local.get 0
    local.get 1
    i32.load offset=8
    i32.store offset=4
    local.get 0
    local.get 1
    i32.load
    i32.store)
  (func $_ZN244_$LT$std..error..$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..boxed..Box$LT$dyn$u20$std..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$..from..StringError$u20$as$u20$core..fmt..Display$GT$3fmt17h8f27cecacd89bd46E (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h0d142c565b9fed95E)
  (func $_ZN242_$LT$std..error..$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..boxed..Box$LT$dyn$u20$std..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$..from..StringError$u20$as$u20$core..fmt..Debug$GT$3fmt17hddb087305b783b60E (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h7843956b8f6f7061E)
  (func $_ZN3std3sys4wasi17decode_error_kind17h0a01760857e06c9eE (type 5) (param i32) (result i32)
    (local i32)
    i32.const 16
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.const 65535
      i32.gt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 65535
      i32.and
      i32.const -2
      i32.add
      local.tee 0
      i32.const 71
      i32.gt_u
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 0
                                  br_table 2 (;@13;) 7 (;@8;) 6 (;@9;) 14 (;@1;) 13 (;@2;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 5 (;@10;) 0 (;@15;) 1 (;@14;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 12 (;@3;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 9 (;@6;) 10 (;@5;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 8 (;@7;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 4 (;@11;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 2 (;@13;) 3 (;@12;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 11 (;@4;) 2 (;@13;)
                                end
                                i32.const 2
                                return
                              end
                              i32.const 3
                              return
                            end
                            i32.const 1
                            return
                          end
                          i32.const 8
                          return
                        end
                        i32.const 5
                        return
                      end
                      i32.const 4
                      return
                    end
                    i32.const 7
                    return
                  end
                  i32.const 6
                  return
                end
                i32.const 0
                return
              end
              i32.const 15
              return
            end
            i32.const 11
            return
          end
          i32.const 13
          return
        end
        i32.const 9
        return
      end
      i32.const 10
      local.set 1
    end
    local.get 1)
  (func $_ZN72_$LT$std..io..buffered..BufWriter$LT$W$GT$$u20$as$u20$std..io..Write$GT$5write17hf101847c4d141300E (type 4) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i64)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 8
            i32.add
            i32.load
            local.get 3
            i32.add
            local.get 1
            i32.const 4
            i32.add
            local.tee 5
            i32.load
            i32.le_u
            br_if 0 (;@4;)
            local.get 4
            i32.const 16
            i32.add
            local.get 1
            call $_ZN3std2io8buffered18BufWriter$LT$W$GT$9flush_buf17h03fc67e5def2a023E
            local.get 4
            i32.load offset=20
            local.set 6
            local.get 4
            i32.load offset=16
            local.tee 7
            i32.const 255
            i32.and
            i32.const 3
            i32.ne
            br_if 1 (;@3;)
            block  ;; label = @5
              i32.const 0
              br_if 0 (;@5;)
              local.get 7
              i32.const 3
              i32.and
              i32.const 2
              i32.ne
              br_if 1 (;@4;)
            end
            local.get 6
            i32.load
            local.get 6
            i32.load offset=4
            i32.load
            call_indirect (type 1)
            block  ;; label = @5
              local.get 6
              i32.load offset=4
              local.tee 7
              i32.load offset=4
              local.tee 8
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              i32.load
              local.get 8
              local.get 7
              i32.load offset=8
              call $__rust_dealloc
            end
            local.get 6
            i32.const 12
            i32.const 4
            call $__rust_dealloc
          end
          local.get 5
          i32.load
          local.get 3
          i32.le_u
          br_if 1 (;@2;)
          local.get 1
          local.get 3
          call $_ZN5alloc3vec12Vec$LT$T$GT$7reserve17heda78ba2e93e6ddbE
          local.get 1
          i32.load
          local.get 1
          i32.const 8
          i32.add
          local.tee 1
          i32.load
          local.tee 5
          i32.add
          local.get 2
          local.get 3
          call $memcpy
          drop
          local.get 0
          local.get 3
          i32.store offset=4
          local.get 1
          local.get 5
          local.get 3
          i32.add
          i32.store
          local.get 0
          i32.const 0
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        i32.const 1
        i32.store
        local.get 0
        local.get 6
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.get 7
        i64.extend_i32_u
        i64.or
        i64.store offset=4 align=4
        br 1 (;@1;)
      end
      local.get 1
      i32.const 1
      i32.store8 offset=13
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load8_u offset=12
          i32.const -1
          i32.add
          local.tee 5
          i32.const 1
          i32.gt_u
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 5
              br_table 1 (;@4;) 0 (;@5;) 1 (;@4;)
            end
            i32.const 1049080
            i32.const 43
            i32.const 1049964
            call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
            unreachable
          end
          local.get 3
          i64.extend_i32_u
          local.set 9
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 4
        local.get 3
        i32.store offset=12
        local.get 4
        local.get 2
        i32.store offset=8
        local.get 4
        i32.const 16
        i32.add
        i32.const 1
        local.get 4
        i32.const 8
        i32.add
        i32.const 1
        call $_ZN4wasi13lib_generated8fd_write17h88522743b3c41194E
        block  ;; label = @3
          local.get 4
          i32.load16_u offset=16
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          i64.load32_u offset=20
          local.set 9
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 4
        local.get 4
        i32.load16_u offset=18
        i32.store16 offset=30
        local.get 3
        i64.extend_i32_u
        local.get 4
        i32.const 30
        i32.add
        call $_ZN4wasi5error5Error9raw_error17hf4fc4403a50dba6eE
        local.tee 3
        i64.extend_i32_u
        i64.const 65535
        i64.and
        i64.const 32
        i64.shl
        local.get 3
        i32.const 65535
        i32.and
        local.tee 3
        i32.const 8
        i32.eq
        select
        local.set 9
        local.get 3
        i32.const 8
        i32.ne
        local.set 3
      end
      local.get 0
      local.get 9
      i64.store offset=4 align=4
      local.get 0
      local.get 3
      i32.store
      local.get 1
      i32.const 0
      i32.store8 offset=13
    end
    local.get 4
    i32.const 32
    i32.add
    global.set 0)
  (func $_ZN3std3sys4wasi2os12error_string17hc9a4b2180ec6a096E (type 6) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 1056
    i32.sub
    local.tee 2
    global.set 0
    i32.const 0
    local.set 3
    local.get 2
    i32.const 8
    i32.add
    i32.const 0
    i32.const 1024
    call $memset
    drop
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              local.get 2
              i32.const 8
              i32.add
              i32.const 1024
              call $strerror_r
              i32.const 0
              i32.lt_s
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 2
                i32.load8_u offset=8
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                i32.const 8
                i32.add
                i32.const 1
                i32.add
                local.set 4
                i32.const 0
                local.set 1
                loop  ;; label = @7
                  local.get 4
                  local.get 1
                  i32.add
                  local.set 5
                  local.get 1
                  i32.const 1
                  i32.add
                  local.tee 3
                  local.set 1
                  local.get 5
                  i32.load8_u
                  br_if 0 (;@7;)
                end
                local.get 3
                i32.const -1
                i32.eq
                br_if 2 (;@4;)
              end
              local.get 2
              i32.const 1032
              i32.add
              local.get 2
              i32.const 8
              i32.add
              local.get 3
              call $_ZN4core3str9from_utf817h4147d06a7789f81eE
              local.get 2
              i32.load offset=1032
              i32.const 1
              i32.eq
              br_if 2 (;@3;)
              local.get 2
              i32.const 1040
              i32.add
              i32.load
              local.tee 1
              i32.const -1
              i32.le_s
              br_if 3 (;@2;)
              local.get 2
              i32.load offset=1036
              local.set 5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  br_if 0 (;@7;)
                  i32.const 1
                  local.set 3
                  i32.const 0
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 1
                local.set 4
                local.get 1
                i32.const 1
                call $__rust_alloc
                local.tee 3
                i32.eqz
                br_if 5 (;@1;)
              end
              local.get 2
              i32.const 0
              i32.store offset=1040
              local.get 2
              local.get 3
              i32.store offset=1032
              local.get 2
              local.get 4
              i32.store offset=1036
              local.get 2
              i32.const 1032
              i32.add
              local.get 1
              call $_ZN5alloc3vec12Vec$LT$T$GT$7reserve17heda78ba2e93e6ddbE
              local.get 2
              i32.load offset=1032
              local.get 2
              i32.load offset=1040
              local.tee 3
              i32.add
              local.get 5
              local.get 1
              call $memcpy
              drop
              local.get 0
              i32.const 8
              i32.add
              local.get 3
              local.get 1
              i32.add
              i32.store
              local.get 0
              local.get 2
              i64.load offset=1032
              i64.store align=4
              local.get 2
              i32.const 1056
              i32.add
              global.set 0
              return
            end
            i32.const 1052276
            i32.const 18
            i32.const 1052320
            call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
            unreachable
          end
          local.get 3
          i32.const 0
          i32.const 1049852
          call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
          unreachable
        end
        local.get 2
        local.get 2
        i64.load offset=1036 align=4
        i64.store offset=1048
        i32.const 1049172
        i32.const 43
        local.get 2
        i32.const 1048
        i32.add
        i32.const 1049216
        i32.const 1052336
        call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
        unreachable
      end
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h00a2a19d2e670c1eE
      unreachable
    end
    local.get 1
    i32.const 1
    call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h1ab5c239c842986eE
    unreachable)
  (func $_ZN3std2io5impls71_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..boxed..Box$LT$W$GT$$GT$5write17h6eb49032bb7d1e27E (type 4) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.load
    local.get 2
    local.get 3
    local.get 1
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 4))
  (func $_ZN3std2io5impls71_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..boxed..Box$LT$W$GT$$GT$14write_vectored17he5299a3cb28c5fc6E (type 4) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.load
    local.get 2
    local.get 3
    local.get 1
    i32.load offset=4
    i32.load offset=16
    call_indirect (type 4))
  (func $_ZN3std2io5impls71_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..boxed..Box$LT$W$GT$$GT$17is_write_vectored17h3aebec87a302fb55E (type 5) (param i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    i32.load offset=20
    call_indirect (type 5))
  (func $_ZN3std2io5impls71_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..boxed..Box$LT$W$GT$$GT$5flush17h453d4cb3a98eec9bE (type 6) (param i32 i32)
    local.get 0
    local.get 1
    i32.load
    local.get 1
    i32.load offset=4
    i32.load offset=24
    call_indirect (type 6))
  (func $_ZN3std2io5impls71_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..boxed..Box$LT$W$GT$$GT$9write_all17h50557d4e500ea2b9E (type 4) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.load
    local.get 2
    local.get 3
    local.get 1
    i32.load offset=4
    i32.load offset=28
    call_indirect (type 4))
  (func $_ZN3std2io5impls71_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..boxed..Box$LT$W$GT$$GT$9write_fmt17h99e751738b71fff0E (type 7) (param i32 i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    local.get 1
    i32.load
    local.set 4
    local.get 1
    i32.load offset=4
    local.set 1
    local.get 3
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 2
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    local.get 2
    i64.load align=4
    i64.store offset=8
    local.get 0
    local.get 4
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    i32.load offset=36
    call_indirect (type 7)
    local.get 3
    i32.const 32
    i32.add
    global.set 0)
  (func $_ZN60_$LT$std..io..stdio..StderrRaw$u20$as$u20$std..io..Write$GT$5write17h912c877745d11fe6E (type 4) (param i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    local.get 3
    i32.store offset=12
    local.get 4
    local.get 2
    i32.store offset=8
    i32.const 1
    local.set 2
    local.get 4
    i32.const 16
    i32.add
    i32.const 2
    local.get 4
    i32.const 8
    i32.add
    i32.const 1
    call $_ZN4wasi13lib_generated8fd_write17h88522743b3c41194E
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.load16_u offset=16
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 4
        local.get 4
        i32.load16_u offset=18
        i32.store16 offset=30
        local.get 0
        local.get 4
        i32.const 30
        i32.add
        call $_ZN4wasi5error5Error9raw_error17hf4fc4403a50dba6eE
        i64.extend_i32_u
        i64.const 65535
        i64.and
        i64.const 32
        i64.shl
        i64.store offset=4 align=4
        br 1 (;@1;)
      end
      local.get 0
      local.get 4
      i32.load offset=20
      i32.store offset=4
      i32.const 0
      local.set 2
    end
    local.get 0
    local.get 2
    i32.store
    local.get 4
    i32.const 32
    i32.add
    global.set 0)
  (func $_ZN3std10sys_common11at_exit_imp4push17ha33ee158d7c75638E (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load8_u offset=1058361
          br_if 0 (;@3;)
          i32.const 0
          i32.const 1
          i32.store8 offset=1058361
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1058280
              local.tee 2
              i32.const 1
              i32.gt_u
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 2
                br_table 0 (;@6;) 2 (;@4;) 0 (;@6;)
              end
              i32.const 12
              i32.const 4
              call $__rust_alloc
              local.tee 2
              i32.eqz
              br_if 3 (;@2;)
              local.get 2
              i32.const 0
              i32.store offset=8
              local.get 2
              i64.const 4
              i64.store align=4
              i32.const 0
              local.get 2
              i32.store offset=1058280
            end
            block  ;; label = @5
              local.get 2
              i32.load offset=8
              local.tee 3
              local.get 2
              i32.const 4
              i32.add
              i32.load
              i32.eq
              br_if 0 (;@5;)
              local.get 2
              i32.load
              local.set 4
              br 4 (;@1;)
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.const 1
                i32.add
                local.tee 4
                local.get 3
                i32.lt_u
                br_if 0 (;@6;)
                local.get 3
                i32.const 1
                i32.shl
                local.tee 5
                local.get 4
                local.get 5
                local.get 4
                i32.gt_u
                select
                local.tee 4
                i32.const 4
                local.get 4
                i32.const 4
                i32.gt_u
                select
                local.tee 6
                i32.const 536870911
                i32.and
                local.tee 7
                local.get 6
                i32.ne
                br_if 0 (;@6;)
                local.get 6
                i32.const 3
                i32.shl
                local.tee 5
                i32.const 0
                i32.lt_s
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 2
                      i32.load
                      i32.const 0
                      local.get 3
                      select
                      local.tee 4
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 3
                      i32.const 3
                      i32.shl
                      local.tee 6
                      local.get 5
                      i32.eq
                      br_if 1 (;@8;)
                      block  ;; label = @10
                        local.get 6
                        br_if 0 (;@10;)
                        block  ;; label = @11
                          local.get 5
                          br_if 0 (;@11;)
                          i32.const 4
                          local.set 4
                          br 4 (;@7;)
                        end
                        local.get 5
                        i32.const 4
                        call $__rust_alloc
                        local.set 4
                        br 2 (;@8;)
                      end
                      local.get 4
                      local.get 6
                      i32.const 4
                      local.get 5
                      call $__rust_realloc
                      local.set 4
                      br 1 (;@8;)
                    end
                    local.get 7
                    local.get 6
                    i32.eq
                    i32.const 2
                    i32.shl
                    local.set 4
                    local.get 5
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 5
                    local.get 4
                    call $__rust_alloc
                    local.set 4
                  end
                  local.get 4
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 2
                  i32.load offset=8
                  local.set 3
                end
                local.get 2
                local.get 4
                i32.store
                local.get 2
                i32.const 4
                i32.add
                local.get 5
                i32.const 3
                i32.shr_u
                i32.store
                br 5 (;@1;)
              end
              call $_ZN5alloc7raw_vec17capacity_overflow17h232763bca8857af5E
              unreachable
            end
            local.get 5
            i32.const 4
            call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
            unreachable
          end
          i32.const 0
          i32.const 0
          i32.store8 offset=1058361
          local.get 0
          local.get 1
          i32.load
          call_indirect (type 1)
          block  ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 2
            local.get 1
            i32.load offset=8
            call $__rust_dealloc
          end
          i32.const 0
          return
        end
        i32.const 1052192
        i32.const 32
        i32.const 1052260
        call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
        unreachable
      end
      i32.const 12
      i32.const 4
      call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
      unreachable
    end
    local.get 4
    local.get 3
    i32.const 3
    i32.shl
    i32.add
    local.tee 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 2
    local.get 2
    i32.load offset=8
    i32.const 1
    i32.add
    i32.store offset=8
    i32.const 0
    i32.const 0
    i32.store8 offset=1058361
    i32.const 1)
  (func $_ZN3std2io5stdio6stdout17h0bb5151ba21c8b62E (type 11) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load8_u offset=1058276
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 1
                  i32.store8 offset=1058276
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1058272
                      local.tee 1
                      i32.const 1
                      i32.gt_u
                      br_if 0 (;@9;)
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 1
                          br_table 1 (;@10;) 0 (;@11;) 1 (;@10;)
                        end
                        i32.const 0
                        i32.const 0
                        i32.store8 offset=1058276
                        br 9 (;@1;)
                      end
                      i32.const 4
                      i32.const 4
                      call $__rust_alloc
                      local.tee 1
                      i32.eqz
                      br_if 3 (;@6;)
                      local.get 1
                      i32.const 1058272
                      i32.store
                      local.get 1
                      i32.const 1051388
                      call $_ZN3std10sys_common11at_exit_imp4push17ha33ee158d7c75638E
                      local.set 2
                      i32.const 1024
                      i32.const 1
                      call $__rust_alloc
                      local.tee 3
                      i32.eqz
                      br_if 4 (;@5;)
                      local.get 0
                      i32.const 10
                      i32.add
                      i32.const 2
                      i32.add
                      local.tee 4
                      local.get 0
                      i32.const 13
                      i32.add
                      i32.const 2
                      i32.add
                      i32.load8_u
                      i32.store8
                      local.get 0
                      local.get 0
                      i32.load16_u offset=13 align=1
                      i32.store16 offset=10
                      i32.const 32
                      i32.const 4
                      call $__rust_alloc
                      local.tee 1
                      i32.eqz
                      br_if 5 (;@4;)
                      local.get 1
                      i32.const 0
                      i32.store8 offset=28
                      local.get 1
                      i32.const 0
                      i32.store16 offset=24
                      local.get 1
                      i64.const 1024
                      i64.store offset=16 align=4
                      local.get 1
                      local.get 3
                      i32.store offset=12
                      local.get 1
                      i32.const 0
                      i32.store offset=8
                      local.get 1
                      i64.const 4294967297
                      i64.store align=4
                      local.get 1
                      local.get 0
                      i32.load16_u offset=10
                      i32.store16 offset=29 align=1
                      local.get 1
                      i32.const 31
                      i32.add
                      local.get 4
                      i32.load8_u
                      i32.store8
                      local.get 2
                      i32.eqz
                      br_if 1 (;@8;)
                      local.get 1
                      local.get 1
                      i32.load
                      local.tee 2
                      i32.const 1
                      i32.add
                      i32.store
                      local.get 2
                      i32.const -1
                      i32.le_s
                      br_if 6 (;@3;)
                      i32.const 4
                      i32.const 4
                      call $__rust_alloc
                      local.tee 2
                      i32.eqz
                      br_if 7 (;@2;)
                      i32.const 0
                      local.get 2
                      i32.store offset=1058272
                      local.get 2
                      local.get 1
                      i32.store
                      br 1 (;@8;)
                    end
                    local.get 1
                    i32.load
                    local.tee 1
                    local.get 1
                    i32.load
                    local.tee 2
                    i32.const 1
                    i32.add
                    i32.store
                    local.get 2
                    i32.const -1
                    i32.le_s
                    br_if 5 (;@3;)
                  end
                  i32.const 0
                  i32.const 0
                  i32.store8 offset=1058276
                  local.get 1
                  i32.eqz
                  br_if 6 (;@1;)
                  local.get 0
                  i32.const 16
                  i32.add
                  global.set 0
                  local.get 1
                  return
                end
                i32.const 1052192
                i32.const 32
                i32.const 1052260
                call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
                unreachable
              end
              i32.const 4
              i32.const 4
              call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
              unreachable
            end
            i32.const 1024
            i32.const 1
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h1ab5c239c842986eE
            unreachable
          end
          i32.const 32
          i32.const 4
          call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
          unreachable
        end
        unreachable
        unreachable
      end
      i32.const 4
      i32.const 4
      call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
      unreachable
    end
    i32.const 1050390
    i32.const 36
    i32.const 1050428
    call $_ZN4core6option13expect_failed17hf689d8761c64e95fE
    unreachable)
  (func $_ZN61_$LT$std..io..stdio..StdoutLock$u20$as$u20$std..io..Write$GT$5write17h318ff9a8d34e94bcE (type 4) (param i32 i32 i32 i32)
    (local i32 i32 i64 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load
              local.tee 1
              i32.load
              br_if 0 (;@5;)
              local.get 1
              i32.const -1
              i32.store
              local.get 1
              i32.const 4
              i32.add
              local.set 5
              block  ;; label = @6
                local.get 1
                i32.const 20
                i32.add
                i32.load8_u
                i32.eqz
                br_if 0 (;@6;)
                local.get 4
                i32.const 16
                i32.add
                local.get 5
                call $_ZN3std2io8buffered18BufWriter$LT$W$GT$9flush_buf17h03fc67e5def2a023E
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 4
                      i32.load8_u offset=16
                      i32.const 3
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 1
                      i32.const 16
                      i32.add
                      i32.load8_u
                      i32.const 2
                      i32.ne
                      br_if 1 (;@8;)
                      i32.const 1049080
                      i32.const 43
                      i32.const 1049964
                      call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
                      unreachable
                    end
                    local.get 4
                    i64.load offset=16
                    local.tee 6
                    i64.const 255
                    i64.and
                    i64.const 3
                    i64.ne
                    br_if 1 (;@7;)
                  end
                  local.get 1
                  i32.const 0
                  i32.store8 offset=20
                  br 1 (;@6;)
                end
                local.get 6
                i32.wrap_i64
                local.tee 7
                i32.const 255
                i32.and
                i32.const 3
                i32.ne
                br_if 2 (;@4;)
                block  ;; label = @7
                  i32.const 0
                  br_if 0 (;@7;)
                  local.get 7
                  i32.const 3
                  i32.and
                  i32.const 2
                  i32.ne
                  br_if 1 (;@6;)
                end
                local.get 6
                i64.const 32
                i64.shr_u
                i32.wrap_i64
                local.tee 7
                i32.load
                local.get 7
                i32.load offset=4
                i32.load
                call_indirect (type 1)
                block  ;; label = @7
                  local.get 7
                  i32.load offset=4
                  local.tee 8
                  i32.load offset=4
                  local.tee 9
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 7
                  i32.load
                  local.get 9
                  local.get 8
                  i32.load offset=8
                  call $__rust_dealloc
                end
                local.get 7
                i32.const 12
                i32.const 4
                call $__rust_dealloc
              end
              local.get 4
              i32.const 8
              i32.add
              i32.const 10
              local.get 2
              local.get 3
              call $_ZN4core5slice6memchr7memrchr17h4b8437429e29ecf5E
              block  ;; label = @6
                local.get 4
                i32.load offset=8
                br_if 0 (;@6;)
                local.get 0
                local.get 5
                local.get 2
                local.get 3
                call $_ZN72_$LT$std..io..buffered..BufWriter$LT$W$GT$$u20$as$u20$std..io..Write$GT$5write17hf101847c4d141300E
                br 5 (;@1;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.load offset=12
                  local.tee 8
                  i32.const -1
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const 1
                  i32.add
                  local.set 7
                  local.get 8
                  local.get 3
                  i32.lt_u
                  br_if 1 (;@6;)
                  local.get 7
                  local.get 3
                  i32.const 1049980
                  call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
                  unreachable
                end
                i32.const 1049980
                call $_ZN4core5slice25slice_index_overflow_fail17h55e360d291e497e5E
                unreachable
              end
              local.get 4
              i32.const 16
              i32.add
              local.get 5
              local.get 2
              local.get 7
              call $_ZN72_$LT$std..io..buffered..BufWriter$LT$W$GT$$u20$as$u20$std..io..Write$GT$5write17hf101847c4d141300E
              local.get 4
              i32.const 24
              i32.add
              i32.load
              local.set 9
              local.get 4
              i32.load offset=20
              local.set 8
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.load offset=16
                  local.tee 10
                  i32.const 1
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 10
                  br_table 1 (;@6;) 4 (;@3;) 1 (;@6;)
                end
                local.get 8
                i32.const 255
                i32.and
                i32.const 2
                i32.lt_u
                br_if 0 (;@6;)
                local.get 9
                i32.load
                local.get 9
                i32.load offset=4
                i32.load
                call_indirect (type 1)
                block  ;; label = @7
                  local.get 9
                  i32.load offset=4
                  local.tee 10
                  i32.load offset=4
                  local.tee 11
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 9
                  i32.load
                  local.get 11
                  local.get 10
                  i32.load offset=8
                  call $__rust_dealloc
                end
                local.get 9
                i32.const 12
                i32.const 4
                call $__rust_dealloc
              end
              local.get 1
              i32.const 1
              i32.store8 offset=20
              local.get 4
              i32.const 16
              i32.add
              local.get 5
              call $_ZN3std2io8buffered18BufWriter$LT$W$GT$9flush_buf17h03fc67e5def2a023E
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 4
                      i32.load8_u offset=16
                      i32.const 3
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 1
                      i32.const 16
                      i32.add
                      i32.load8_u
                      i32.const 2
                      i32.ne
                      br_if 1 (;@8;)
                      i32.const 1049080
                      i32.const 43
                      i32.const 1049964
                      call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
                      unreachable
                    end
                    local.get 4
                    i64.load8_u offset=16
                    i64.const 3
                    i64.ne
                    br_if 1 (;@7;)
                  end
                  local.get 1
                  i32.const 0
                  i32.store8 offset=20
                  local.get 8
                  local.get 7
                  i32.eq
                  br_if 1 (;@6;)
                  br 5 (;@2;)
                end
                local.get 4
                i32.load offset=20
                local.set 9
                local.get 8
                local.get 7
                i32.ne
                local.get 4
                i32.load offset=16
                local.tee 11
                i32.const 255
                i32.and
                i32.const 3
                i32.ne
                i32.or
                local.set 10
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    br_if 0 (;@8;)
                    local.get 11
                    i32.const 3
                    i32.and
                    i32.const 2
                    i32.ne
                    br_if 1 (;@7;)
                  end
                  local.get 9
                  i32.load
                  local.get 9
                  i32.load offset=4
                  i32.load
                  call_indirect (type 1)
                  block  ;; label = @8
                    local.get 9
                    i32.load offset=4
                    local.tee 11
                    i32.load offset=4
                    local.tee 12
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 9
                    i32.load
                    local.get 12
                    local.get 11
                    i32.load offset=8
                    call $__rust_dealloc
                  end
                  local.get 9
                  i32.const 12
                  i32.const 4
                  call $__rust_dealloc
                end
                local.get 10
                br_if 4 (;@2;)
              end
              local.get 4
              i32.const 16
              i32.add
              local.get 5
              local.get 2
              local.get 7
              i32.add
              local.get 3
              local.get 7
              i32.sub
              call $_ZN72_$LT$std..io..buffered..BufWriter$LT$W$GT$$u20$as$u20$std..io..Write$GT$5write17hf101847c4d141300E
              block  ;; label = @6
                local.get 4
                i32.load offset=16
                i32.const 1
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                i32.const 0
                i32.store
                local.get 0
                local.get 4
                i32.load offset=20
                local.get 8
                i32.add
                i32.store offset=4
                br 5 (;@1;)
              end
              local.get 0
              i32.const 0
              i32.store
              local.get 0
              local.get 8
              i32.store offset=4
              local.get 4
              i32.load8_u offset=20
              i32.const 2
              i32.lt_u
              br_if 4 (;@1;)
              local.get 4
              i32.const 24
              i32.add
              i32.load
              local.tee 5
              i32.load
              local.get 5
              i32.load offset=4
              i32.load
              call_indirect (type 1)
              block  ;; label = @6
                local.get 5
                i32.load offset=4
                local.tee 2
                i32.load offset=4
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                i32.load
                local.get 3
                local.get 2
                i32.load offset=8
                call $__rust_dealloc
              end
              local.get 5
              i32.const 12
              i32.const 4
              call $__rust_dealloc
              br 4 (;@1;)
            end
            i32.const 1048812
            i32.const 16
            local.get 4
            i32.const 16
            i32.add
            i32.const 1049140
            i32.const 1048896
            call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
            unreachable
          end
          local.get 0
          i32.const 1
          i32.store
          local.get 0
          local.get 6
          i64.store offset=4 align=4
          br 2 (;@1;)
        end
        local.get 0
        i32.const 1
        i32.store
        local.get 0
        local.get 9
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.get 8
        i64.extend_i32_u
        i64.or
        i64.store offset=4 align=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store
      local.get 0
      local.get 8
      i32.store offset=4
    end
    local.get 1
    local.get 1
    i32.load
    i32.const 1
    i32.add
    i32.store
    local.get 4
    i32.const 32
    i32.add
    global.set 0)
  (func $_ZN57_$LT$std..io..stdio..Stdout$u20$as$u20$std..io..Write$GT$9write_fmt17hc12753628cececa7E (type 7) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.load
    i32.const 8
    i32.add
    i32.store offset=4
    local.get 3
    i32.const 3
    i32.store8 offset=12
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=8
    local.get 3
    i32.const 24
    i32.add
    i32.const 16
    i32.add
    local.get 2
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    i32.const 24
    i32.add
    i32.const 8
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    local.get 2
    i64.load align=4
    i64.store offset=24
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 8
          i32.add
          i32.const 1050560
          local.get 3
          i32.const 24
          i32.add
          call $_ZN4core3fmt5write17hf78275652148e08fE
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 3
            i32.load8_u offset=12
            i32.const 3
            i32.ne
            br_if 0 (;@4;)
            local.get 3
            i32.const 24
            i32.add
            i32.const 16
            i32.const 1050584
            i32.const 15
            call $_ZN3std2io5error5Error3new17h241fae668dc94904E
            local.get 0
            local.get 3
            i64.load offset=24
            i64.store align=4
            br 2 (;@2;)
          end
          local.get 0
          local.get 3
          i64.load offset=12 align=4
          i64.store align=4
          br 2 (;@1;)
        end
        local.get 0
        i32.const 3
        i32.store8
      end
      block  ;; label = @2
        i32.const 0
        br_if 0 (;@2;)
        local.get 3
        i32.load8_u offset=12
        i32.const 2
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 3
      i32.const 16
      i32.add
      i32.load
      local.tee 2
      i32.load
      local.get 2
      i32.load offset=4
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 2
        i32.load offset=4
        local.tee 0
        i32.load offset=4
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load
        local.get 1
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 3
      i32.load offset=16
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 3
    i32.const 48
    i32.add
    global.set 0)
  (func $_ZN3std4sync4once4Once10call_inner17hca77e4a078ff76abE (type 4) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    i32.const 2
    i32.or
    local.set 5
    local.get 0
    i32.load
    local.set 6
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            br_if 0 (;@4;)
            loop  ;; label = @5
              block  ;; label = @6
                local.get 6
                i32.const 3
                i32.gt_u
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 6
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 6 (;@2;) 1 (;@7;)
                  end
                  i32.const 1050856
                  i32.const 42
                  i32.const 1050900
                  call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
                  unreachable
                end
                local.get 0
                local.get 0
                i32.load
                local.tee 6
                i32.const 2
                local.get 6
                select
                i32.store
                local.get 6
                br_if 1 (;@5;)
                i32.const 0
                local.set 1
                br 3 (;@3;)
              end
              local.get 6
              i32.const 3
              i32.and
              i32.const 2
              i32.ne
              br_if 4 (;@1;)
              block  ;; label = @6
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 6
                    local.set 1
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1058340
                      i32.const 1
                      i32.eq
                      br_if 0 (;@9;)
                      i32.const 0
                      i64.const 1
                      i64.store offset=1058340 align=4
                      i32.const 0
                      i32.const 0
                      i32.store offset=1058348
                    end
                    i32.const 1058344
                    call $_ZN3std10sys_common11thread_info10ThreadInfo4with28_$u7b$$u7b$closure$u7d$$u7d$17hf9f457c8fb351805E
                    local.set 7
                    local.get 0
                    local.get 5
                    local.get 0
                    i32.load
                    local.tee 6
                    local.get 6
                    local.get 1
                    i32.eq
                    select
                    i32.store
                    local.get 4
                    i32.const 0
                    i32.store8 offset=8
                    local.get 4
                    local.get 7
                    i32.store
                    local.get 4
                    local.get 1
                    i32.const -4
                    i32.and
                    i32.store offset=4
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 6
                        local.get 1
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 4
                        i32.load8_u offset=8
                        i32.eqz
                        br_if 1 (;@9;)
                        br 3 (;@7;)
                      end
                      block  ;; label = @10
                        local.get 4
                        i32.load
                        local.tee 1
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 1
                        local.get 1
                        i32.load
                        local.tee 7
                        i32.const -1
                        i32.add
                        i32.store
                        local.get 7
                        i32.const 1
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 4
                        call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h60f285450f6f3f75E
                      end
                      local.get 6
                      i32.const 3
                      i32.and
                      i32.const 2
                      i32.eq
                      br_if 1 (;@8;)
                      br 3 (;@6;)
                    end
                  end
                  loop  ;; label = @8
                    call $_ZN3std6thread4park17h939424159e238725E
                    local.get 4
                    i32.load8_u offset=8
                    i32.eqz
                    br_if 0 (;@8;)
                  end
                end
                local.get 4
                i32.load
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                local.get 1
                i32.load
                local.tee 6
                i32.const -1
                i32.add
                i32.store
                local.get 6
                i32.const 1
                i32.ne
                br_if 0 (;@6;)
                local.get 4
                call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h60f285450f6f3f75E
                local.get 0
                i32.load
                local.set 6
                br 1 (;@5;)
              end
              local.get 0
              i32.load
              local.set 6
              br 0 (;@5;)
            end
          end
          loop  ;; label = @4
            block  ;; label = @5
              local.get 6
              local.tee 1
              i32.const 3
              i32.gt_u
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 1
                br_table 0 (;@6;) 0 (;@6;) 1 (;@5;) 4 (;@2;) 0 (;@6;)
              end
              local.get 0
              i32.const 2
              local.get 0
              i32.load
              local.tee 6
              local.get 6
              local.get 1
              i32.eq
              local.tee 7
              select
              i32.store
              local.get 7
              i32.eqz
              br_if 1 (;@4;)
              br 2 (;@3;)
            end
            local.get 1
            i32.const 3
            i32.and
            i32.const 2
            i32.ne
            br_if 3 (;@1;)
            block  ;; label = @5
              loop  ;; label = @6
                local.get 1
                local.set 6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1058340
                  i32.const 1
                  i32.eq
                  br_if 0 (;@7;)
                  i32.const 0
                  i64.const 1
                  i64.store offset=1058340 align=4
                  i32.const 0
                  i32.const 0
                  i32.store offset=1058348
                end
                i32.const 1058344
                call $_ZN3std10sys_common11thread_info10ThreadInfo4with28_$u7b$$u7b$closure$u7d$$u7d$17hf9f457c8fb351805E
                local.set 7
                local.get 0
                local.get 5
                local.get 0
                i32.load
                local.tee 1
                local.get 1
                local.get 6
                i32.eq
                local.tee 8
                select
                i32.store
                local.get 4
                i32.const 0
                i32.store8 offset=8
                local.get 4
                local.get 7
                i32.store
                local.get 4
                local.get 6
                i32.const -4
                i32.and
                i32.store offset=4
                block  ;; label = @7
                  local.get 8
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 4
                    i32.load
                    local.tee 6
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 6
                    local.get 6
                    i32.load
                    local.tee 7
                    i32.const -1
                    i32.add
                    i32.store
                    local.get 7
                    i32.const 1
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 4
                    call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h60f285450f6f3f75E
                  end
                  local.get 1
                  i32.const 3
                  i32.and
                  i32.const 2
                  i32.eq
                  br_if 1 (;@6;)
                  br 2 (;@5;)
                end
              end
              block  ;; label = @6
                local.get 4
                i32.load8_u offset=8
                br_if 0 (;@6;)
                loop  ;; label = @7
                  call $_ZN3std6thread4park17h939424159e238725E
                  local.get 4
                  i32.load8_u offset=8
                  i32.eqz
                  br_if 0 (;@7;)
                end
              end
              local.get 4
              i32.load
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              local.get 1
              i32.load
              local.tee 6
              i32.const -1
              i32.add
              i32.store
              local.get 6
              i32.const 1
              i32.ne
              br_if 0 (;@5;)
              local.get 4
              call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h60f285450f6f3f75E
            end
            local.get 0
            i32.load
            local.set 6
            br 0 (;@4;)
          end
        end
        local.get 4
        local.get 0
        i32.store
        local.get 2
        local.get 1
        i32.const 1
        i32.eq
        local.get 3
        i32.load offset=12
        call_indirect (type 6)
        local.get 4
        i32.const 3
        i32.store offset=4
        local.get 4
        call $_ZN70_$LT$std..sync..once..WaiterQueue$u20$as$u20$core..ops..drop..Drop$GT$4drop17h49d83c7df7d961c7E
      end
      local.get 4
      i32.const 16
      i32.add
      global.set 0
      return
    end
    i32.const 1050780
    i32.const 57
    i32.const 1050840
    call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
    unreachable)
  (func $_ZN3std2io5stdio9set_panic17h7aca8b71dbb6c3c1E (type 7) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    i32.const 0
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1058324
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          i32.const 0
          i64.const 1
          i64.store offset=1058324 align=4
          i32.const 0
          i32.const 0
          i32.store offset=1058332
          br 1 (;@2;)
        end
        i32.const 0
        i32.load offset=1058328
        br_if 1 (;@1;)
        i32.const 0
        i32.load offset=1058332
        local.set 4
      end
      i32.const 0
      local.get 1
      i32.store offset=1058332
      i32.const 0
      i32.load offset=1058336
      local.set 1
      i32.const 0
      local.get 2
      i32.store offset=1058336
      i32.const 0
      i32.const 0
      i32.store offset=1058328
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 4
        local.get 1
        i32.load offset=24
        call_indirect (type 6)
        block  ;; label = @3
          i32.const 0
          br_if 0 (;@3;)
          local.get 3
          i32.load8_u
          i32.const 2
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 3
        i32.load offset=4
        local.tee 2
        i32.load
        local.get 2
        i32.load offset=4
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 2
          i32.load offset=4
          local.tee 5
          i32.load offset=4
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.load
          local.get 6
          local.get 5
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 2
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 4
      i32.store
      local.get 0
      local.get 1
      i32.store offset=4
      local.get 3
      i32.const 16
      i32.add
      global.set 0
      return
    end
    i32.const 1048812
    i32.const 16
    local.get 3
    i32.const 8
    i32.add
    i32.const 1049140
    i32.const 1048896
    call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
    unreachable)
  (func $_ZN3std2io5stdio6_print17h53f0a7747fc3663eE (type 1) (param i32)
    (local i32 i32 i64 i32 i32)
    global.get 0
    i32.const 96
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 1
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 0
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 1
    local.get 0
    i64.load align=4
    i64.store offset=8
    local.get 1
    i32.const 6
    i32.store offset=36
    local.get 1
    i32.const 1050500
    i32.store offset=32
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1058308
                  i32.const 1
                  i32.eq
                  br_if 0 (;@7;)
                  i32.const 0
                  i64.const 1
                  i64.store offset=1058308 align=4
                  i32.const 0
                  i32.const 0
                  i32.store offset=1058316
                  br 1 (;@6;)
                end
                i32.const 0
                i32.load offset=1058312
                br_if 3 (;@3;)
                i32.const 0
                i32.const 0
                i32.store offset=1058312
                i32.const 0
                i32.load offset=1058316
                local.set 0
                i32.const 0
                i32.const 0
                i32.store offset=1058316
                local.get 0
                br_if 1 (;@5;)
              end
              local.get 1
              call $_ZN3std2io5stdio6stdout17h0bb5151ba21c8b62E
              local.tee 0
              i32.store offset=48
              local.get 1
              i32.const 72
              i32.add
              i32.const 16
              i32.add
              local.get 1
              i32.const 8
              i32.add
              i32.const 16
              i32.add
              i64.load
              i64.store
              local.get 1
              i32.const 72
              i32.add
              i32.const 8
              i32.add
              local.get 1
              i32.const 8
              i32.add
              i32.const 8
              i32.add
              i64.load
              i64.store
              local.get 1
              local.get 1
              i64.load offset=8
              i64.store offset=72
              local.get 1
              i32.const 64
              i32.add
              local.get 1
              i32.const 48
              i32.add
              local.get 1
              i32.const 72
              i32.add
              call $_ZN57_$LT$std..io..stdio..Stdout$u20$as$u20$std..io..Write$GT$9write_fmt17hc12753628cececa7E
              local.get 0
              local.get 0
              i32.load
              local.tee 2
              i32.const -1
              i32.add
              i32.store
              block  ;; label = @6
                local.get 2
                i32.const 1
                i32.ne
                br_if 0 (;@6;)
                local.get 1
                i32.const 48
                i32.add
                call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h70f80a623fd3e456E
              end
              local.get 1
              i64.load offset=64
              local.set 3
              br 1 (;@4;)
            end
            i32.const 0
            i32.load offset=1058320
            local.set 2
            local.get 1
            i32.const 72
            i32.add
            i32.const 16
            i32.add
            local.get 1
            i32.const 8
            i32.add
            i32.const 16
            i32.add
            i64.load
            i64.store
            local.get 1
            i32.const 72
            i32.add
            i32.const 8
            i32.add
            local.get 1
            i32.const 8
            i32.add
            i32.const 8
            i32.add
            i64.load
            i64.store
            local.get 1
            local.get 1
            i64.load offset=8
            i64.store offset=72
            local.get 1
            i32.const 48
            i32.add
            local.get 0
            local.get 1
            i32.const 72
            i32.add
            local.get 2
            i32.load offset=36
            call_indirect (type 7)
            i32.const 0
            i32.load offset=1058312
            br_if 2 (;@2;)
            i32.const 0
            i32.const -1
            i32.store offset=1058312
            block  ;; label = @5
              i32.const 0
              i32.load offset=1058316
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              i32.const 0
              i32.load offset=1058320
              i32.load
              call_indirect (type 1)
              i32.const 0
              i32.load offset=1058320
              local.tee 4
              i32.load offset=4
              local.tee 5
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1058316
              local.get 5
              local.get 4
              i32.load offset=8
              call $__rust_dealloc
            end
            i32.const 0
            local.get 2
            i32.store offset=1058320
            i32.const 0
            local.get 0
            i32.store offset=1058316
            i32.const 0
            i32.const 0
            i32.load offset=1058312
            i32.const 1
            i32.add
            i32.store offset=1058312
            local.get 1
            local.get 1
            i64.load offset=48
            local.tee 3
            i64.store offset=64
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.wrap_i64
              local.tee 0
              i32.const 255
              i32.and
              i32.const 4
              i32.ne
              br_if 0 (;@5;)
              local.get 1
              call $_ZN3std2io5stdio6stdout17h0bb5151ba21c8b62E
              local.tee 0
              i32.store offset=48
              local.get 1
              i32.const 72
              i32.add
              i32.const 16
              i32.add
              local.get 1
              i32.const 8
              i32.add
              i32.const 16
              i32.add
              i64.load
              i64.store
              local.get 1
              i32.const 72
              i32.add
              i32.const 8
              i32.add
              local.get 1
              i32.const 8
              i32.add
              i32.const 8
              i32.add
              i64.load
              i64.store
              local.get 1
              local.get 1
              i64.load offset=8
              i64.store offset=72
              local.get 1
              i32.const 40
              i32.add
              local.get 1
              i32.const 48
              i32.add
              local.get 1
              i32.const 72
              i32.add
              call $_ZN57_$LT$std..io..stdio..Stdout$u20$as$u20$std..io..Write$GT$9write_fmt17hc12753628cececa7E
              local.get 0
              local.get 0
              i32.load
              local.tee 2
              i32.const -1
              i32.add
              i32.store
              block  ;; label = @6
                local.get 2
                i32.const 1
                i32.ne
                br_if 0 (;@6;)
                local.get 1
                i32.const 48
                i32.add
                call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h70f80a623fd3e456E
              end
              local.get 1
              i32.load8_u offset=40
              local.tee 2
              local.set 0
              br 1 (;@4;)
            end
            local.get 1
            local.get 3
            i64.store offset=40
            local.get 3
            i32.wrap_i64
            local.set 2
          end
          local.get 0
          i32.const 255
          i32.and
          i32.const 3
          i32.ne
          br_if 2 (;@1;)
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              br_if 0 (;@5;)
              local.get 2
              i32.const 3
              i32.and
              i32.const 2
              i32.ne
              br_if 1 (;@4;)
            end
            local.get 1
            i32.load offset=44
            local.tee 0
            i32.load
            local.get 0
            i32.load offset=4
            i32.load
            call_indirect (type 1)
            block  ;; label = @5
              local.get 0
              i32.load offset=4
              local.tee 2
              i32.load offset=4
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load
              local.get 4
              local.get 2
              i32.load offset=8
              call $__rust_dealloc
            end
            local.get 0
            i32.const 12
            i32.const 4
            call $__rust_dealloc
          end
          local.get 1
          i32.const 96
          i32.add
          global.set 0
          return
        end
        i32.const 1048812
        i32.const 16
        local.get 1
        i32.const 72
        i32.add
        i32.const 1049140
        i32.const 1048896
        call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
        unreachable
      end
      i32.const 1048812
      i32.const 16
      local.get 1
      i32.const 72
      i32.add
      i32.const 1049140
      i32.const 1048896
      call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
      unreachable
    end
    local.get 1
    local.get 1
    i64.load offset=40
    i64.store offset=64
    local.get 1
    i32.const 92
    i32.add
    i32.const 2
    i32.store
    local.get 1
    i32.const 60
    i32.add
    i32.const 8
    i32.store
    local.get 1
    i64.const 2
    i64.store offset=76 align=4
    local.get 1
    i32.const 1050468
    i32.store offset=72
    local.get 1
    i32.const 10
    i32.store offset=52
    local.get 1
    local.get 1
    i32.const 48
    i32.add
    i32.store offset=88
    local.get 1
    local.get 1
    i32.const 64
    i32.add
    i32.store offset=56
    local.get 1
    local.get 1
    i32.const 32
    i32.add
    i32.store offset=48
    local.get 1
    i32.const 72
    i32.add
    i32.const 1050484
    call $_ZN3std9panicking15begin_panic_fmt17h08429981da95e9e5E
    unreachable)
  (func $_ZN3std2io5Write14write_vectored17ha0666460d161172dE (type 4) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    local.get 3
    i32.const 3
    i32.shl
    local.set 3
    local.get 2
    i32.const -8
    i32.add
    local.set 5
    block  ;; label = @1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 1049036
          local.set 2
          i32.const 0
          local.set 6
          br 2 (;@1;)
        end
        local.get 3
        i32.const -8
        i32.add
        local.set 3
        local.get 5
        i32.const 8
        i32.add
        local.set 5
        local.get 2
        i32.const 4
        i32.add
        local.set 6
        local.get 2
        i32.const 8
        i32.add
        local.set 2
        local.get 6
        i32.load
        local.tee 6
        i32.eqz
        br_if 0 (;@2;)
      end
      local.get 5
      i32.load
      local.set 2
    end
    local.get 4
    local.get 6
    i32.store offset=12
    local.get 4
    local.get 2
    i32.store offset=8
    i32.const 1
    local.set 2
    local.get 4
    i32.const 16
    i32.add
    i32.const 2
    local.get 4
    i32.const 8
    i32.add
    i32.const 1
    call $_ZN4wasi13lib_generated8fd_write17h88522743b3c41194E
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.load16_u offset=16
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 4
        local.get 4
        i32.load16_u offset=18
        i32.store16 offset=30
        local.get 0
        local.get 4
        i32.const 30
        i32.add
        call $_ZN4wasi5error5Error9raw_error17hf4fc4403a50dba6eE
        i64.extend_i32_u
        i64.const 65535
        i64.and
        i64.const 32
        i64.shl
        i64.store offset=4 align=4
        br 1 (;@1;)
      end
      local.get 0
      local.get 4
      i32.load offset=20
      i32.store offset=4
      i32.const 0
      local.set 2
    end
    local.get 0
    local.get 2
    i32.store
    local.get 4
    i32.const 32
    i32.add
    global.set 0)
  (func $_ZN3std2io5Write17is_write_vectored17h543cbc50b0d68d7bE (type 5) (param i32) (result i32)
    i32.const 0)
  (func $_ZN3std2io5Write18write_all_vectored17h30c34f9cecddc9d3E (type 4) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            loop  ;; label = @5
              local.get 4
              i32.const 8
              i32.add
              local.get 1
              i32.load
              local.get 2
              local.get 3
              local.get 1
              i32.load offset=4
              i32.load offset=16
              call_indirect (type 4)
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 4
                    i32.load offset=8
                    local.tee 5
                    i32.const 1
                    i32.eq
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      local.get 4
                      i32.load offset=12
                      local.tee 6
                      br_if 0 (;@9;)
                      local.get 4
                      i32.const 24
                      i32.add
                      i32.const 14
                      i32.const 1050340
                      i32.const 28
                      call $_ZN3std2io5error5Error3new17h241fae668dc94904E
                      local.get 0
                      local.get 4
                      i64.load offset=24
                      i64.store align=4
                      br 8 (;@1;)
                    end
                    local.get 2
                    i32.const 4
                    i32.add
                    local.set 7
                    local.get 3
                    i32.const 3
                    i32.shl
                    i32.const -8
                    i32.add
                    i32.const 3
                    i32.shr_u
                    i32.const 1
                    i32.add
                    local.set 8
                    i32.const 0
                    local.set 9
                    i32.const 0
                    local.set 10
                    loop  ;; label = @9
                      local.get 7
                      i32.load
                      local.get 10
                      i32.add
                      local.tee 11
                      local.get 6
                      i32.gt_u
                      br_if 2 (;@7;)
                      local.get 7
                      i32.const 8
                      i32.add
                      local.set 7
                      local.get 11
                      local.set 10
                      local.get 8
                      local.get 9
                      i32.const 1
                      i32.add
                      local.tee 9
                      i32.ne
                      br_if 0 (;@9;)
                    end
                    local.get 11
                    local.set 10
                    local.get 8
                    local.set 9
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 4
                          i32.load8_u offset=12
                          local.tee 6
                          br_table 1 (;@10;) 0 (;@11;) 2 (;@9;) 1 (;@10;)
                        end
                        local.get 4
                        i32.load8_u offset=13
                        local.set 7
                        br 2 (;@8;)
                      end
                      local.get 4
                      i32.load offset=16
                      call $_ZN3std3sys4wasi17decode_error_kind17h0a01760857e06c9eE
                      i32.const 255
                      i32.and
                      local.set 7
                      br 1 (;@8;)
                    end
                    local.get 4
                    i32.load offset=16
                    i32.load8_u offset=8
                    local.set 7
                  end
                  i32.const 1
                  local.set 5
                  local.get 7
                  i32.const 255
                  i32.and
                  i32.const 15
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 0
                  local.get 4
                  i64.load offset=12 align=4
                  i64.store align=4
                  br 6 (;@1;)
                end
                local.get 3
                local.get 9
                i32.lt_u
                br_if 3 (;@3;)
                local.get 2
                local.get 9
                i32.const 3
                i32.shl
                i32.add
                local.set 2
                local.get 3
                local.get 9
                i32.sub
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                i32.load offset=4
                local.tee 9
                local.get 6
                local.get 10
                i32.sub
                local.tee 7
                i32.lt_u
                br_if 4 (;@2;)
                local.get 2
                i32.const 4
                i32.add
                local.get 9
                local.get 7
                i32.sub
                i32.store
                local.get 2
                local.get 2
                i32.load
                local.get 7
                i32.add
                i32.store
                local.get 4
                i32.load8_u offset=12
                local.set 6
                local.get 4
                i32.load offset=8
                local.set 5
              end
              block  ;; label = @6
                local.get 5
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                i32.const 255
                i32.and
                i32.const 2
                i32.lt_u
                br_if 0 (;@6;)
                local.get 4
                i32.load offset=16
                local.tee 7
                i32.load
                local.get 7
                i32.load offset=4
                i32.load
                call_indirect (type 1)
                block  ;; label = @7
                  local.get 7
                  i32.load offset=4
                  local.tee 9
                  i32.load offset=4
                  local.tee 10
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 7
                  i32.load
                  local.get 10
                  local.get 9
                  i32.load offset=8
                  call $__rust_dealloc
                end
                local.get 7
                i32.const 12
                i32.const 4
                call $__rust_dealloc
              end
              local.get 3
              br_if 0 (;@5;)
            end
          end
          local.get 0
          i32.const 3
          i32.store8
          br 2 (;@1;)
        end
        local.get 9
        local.get 3
        i32.const 1050528
        call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
        unreachable
      end
      i32.const 1052116
      i32.const 35
      i32.const 1052176
      call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
      unreachable
    end
    local.get 4
    i32.const 32
    i32.add
    global.set 0)
  (func $_ZN3std2io5Write18write_all_vectored17h937b0242149abcbeE (type 4) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 3
          i32.const 3
          i32.shl
          local.set 5
          local.get 2
          i32.const -8
          i32.add
          local.set 6
          local.get 2
          local.set 7
          block  ;; label = @4
            loop  ;; label = @5
              block  ;; label = @6
                local.get 5
                br_if 0 (;@6;)
                i32.const 1049036
                local.set 5
                i32.const 0
                local.set 8
                br 2 (;@4;)
              end
              local.get 5
              i32.const -8
              i32.add
              local.set 5
              local.get 6
              i32.const 8
              i32.add
              local.set 6
              local.get 7
              i32.const 4
              i32.add
              local.set 8
              local.get 7
              i32.const 8
              i32.add
              local.set 7
              local.get 8
              i32.load
              local.tee 8
              i32.eqz
              br_if 0 (;@5;)
            end
            local.get 6
            i32.load
            local.set 5
          end
          local.get 4
          local.get 8
          i32.store offset=12
          local.get 4
          local.get 5
          i32.store offset=8
          local.get 4
          i32.const 16
          i32.add
          i32.const 2
          local.get 4
          i32.const 8
          i32.add
          i32.const 1
          call $_ZN4wasi13lib_generated8fd_write17h88522743b3c41194E
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.load16_u offset=16
                i32.const 1
                i32.eq
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 4
                  i32.load offset=20
                  local.tee 9
                  br_if 0 (;@7;)
                  local.get 4
                  i32.const 16
                  i32.add
                  i32.const 14
                  i32.const 1050340
                  i32.const 28
                  call $_ZN3std2io5error5Error3new17h241fae668dc94904E
                  local.get 0
                  local.get 4
                  i64.load offset=16
                  i64.store align=4
                  br 6 (;@1;)
                end
                local.get 2
                i32.const 4
                i32.add
                local.set 5
                local.get 3
                i32.const 3
                i32.shl
                i32.const -8
                i32.add
                i32.const 3
                i32.shr_u
                i32.const 1
                i32.add
                local.set 10
                i32.const 0
                local.set 7
                i32.const 0
                local.set 6
                loop  ;; label = @7
                  local.get 5
                  i32.load
                  local.get 6
                  i32.add
                  local.tee 8
                  local.get 9
                  i32.gt_u
                  br_if 2 (;@5;)
                  local.get 5
                  i32.const 8
                  i32.add
                  local.set 5
                  local.get 8
                  local.set 6
                  local.get 10
                  local.get 7
                  i32.const 1
                  i32.add
                  local.tee 7
                  i32.ne
                  br_if 0 (;@7;)
                end
                local.get 8
                local.set 6
                local.get 10
                local.set 7
                br 1 (;@5;)
              end
              local.get 4
              local.get 4
              i32.load16_u offset=18
              i32.store16 offset=30
              local.get 4
              i32.const 30
              i32.add
              call $_ZN4wasi5error5Error9raw_error17hf4fc4403a50dba6eE
              i32.const 65535
              i32.and
              local.tee 5
              call $_ZN3std3sys4wasi17decode_error_kind17h0a01760857e06c9eE
              i32.const 255
              i32.and
              i32.const 15
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              i32.const 0
              i32.store
              local.get 0
              i32.const 4
              i32.add
              local.get 5
              i32.store
              br 4 (;@1;)
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                local.get 7
                i32.lt_u
                br_if 0 (;@6;)
                local.get 2
                local.get 7
                i32.const 3
                i32.shl
                i32.add
                local.set 2
                local.get 3
                local.get 7
                i32.sub
                local.tee 3
                i32.eqz
                br_if 2 (;@4;)
                local.get 2
                i32.load offset=4
                local.tee 7
                local.get 9
                local.get 6
                i32.sub
                local.tee 5
                i32.lt_u
                br_if 1 (;@5;)
                local.get 2
                i32.const 4
                i32.add
                local.get 7
                local.get 5
                i32.sub
                i32.store
                local.get 2
                local.get 2
                i32.load
                local.get 5
                i32.add
                i32.store
                br 2 (;@4;)
              end
              local.get 7
              local.get 3
              i32.const 1050528
              call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
              unreachable
            end
            i32.const 1052116
            i32.const 35
            i32.const 1052176
            call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
            unreachable
          end
          local.get 3
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.const 3
      i32.store8
    end
    local.get 4
    i32.const 32
    i32.add
    global.set 0)
  (func $_ZN3std2io5Write9write_fmt17h509c48398dd5c56bE (type 7) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 3
    i32.store8 offset=12
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    i32.const 24
    i32.add
    i32.const 16
    i32.add
    local.get 2
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    i32.const 24
    i32.add
    i32.const 8
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    local.get 2
    i64.load align=4
    i64.store offset=24
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 8
          i32.add
          i32.const 1050600
          local.get 3
          i32.const 24
          i32.add
          call $_ZN4core3fmt5write17hf78275652148e08fE
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 3
            i32.load8_u offset=12
            i32.const 3
            i32.ne
            br_if 0 (;@4;)
            local.get 3
            i32.const 24
            i32.add
            i32.const 16
            i32.const 1050584
            i32.const 15
            call $_ZN3std2io5error5Error3new17h241fae668dc94904E
            local.get 0
            local.get 3
            i64.load offset=24
            i64.store align=4
            br 2 (;@2;)
          end
          local.get 0
          local.get 3
          i64.load offset=12 align=4
          i64.store align=4
          br 2 (;@1;)
        end
        local.get 0
        i32.const 3
        i32.store8
      end
      block  ;; label = @2
        i32.const 0
        br_if 0 (;@2;)
        local.get 3
        i32.load8_u offset=12
        i32.const 2
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 3
      i32.const 16
      i32.add
      i32.load
      local.tee 2
      i32.load
      local.get 2
      i32.load offset=4
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 2
        i32.load offset=4
        local.tee 0
        i32.load offset=4
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load
        local.get 1
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 3
      i32.load offset=16
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 3
    i32.const 48
    i32.add
    global.set 0)
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adaptor$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h612bf57410edd764E (type 8) (param i32 i32 i32) (result i32)
    (local i32 i64 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    i32.load
    local.get 1
    local.get 2
    call $_ZN3std2io5Write9write_all17h39d0435291d0ea60E
    i32.const 0
    local.set 1
    block  ;; label = @1
      local.get 3
      i32.load8_u offset=8
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      local.get 3
      i64.load offset=8
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          br_if 0 (;@3;)
          local.get 0
          i32.load8_u offset=4
          i32.const 2
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 0
        i32.const 8
        i32.add
        i32.load
        local.tee 1
        i32.load
        local.get 1
        i32.load offset=4
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 2
          i32.load offset=4
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load
          local.get 5
          local.get 2
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 0
        i32.load offset=8
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 4
      i64.store offset=4 align=4
      i32.const 1
      local.set 1
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adaptor$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hc2a4146e00a3c941E (type 8) (param i32 i32 i32) (result i32)
    (local i32 i64 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    i32.load
    local.get 1
    local.get 2
    call $_ZN3std2io5Write9write_all17hb4b7128eb566cce6E
    i32.const 0
    local.set 1
    block  ;; label = @1
      local.get 3
      i32.load8_u offset=8
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      local.get 3
      i64.load offset=8
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          br_if 0 (;@3;)
          local.get 0
          i32.load8_u offset=4
          i32.const 2
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 0
        i32.const 8
        i32.add
        i32.load
        local.tee 1
        i32.load
        local.get 1
        i32.load offset=4
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 2
          i32.load offset=4
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load
          local.get 5
          local.get 2
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 0
        i32.load offset=8
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      local.get 4
      i64.store offset=4 align=4
      i32.const 1
      local.set 1
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN59_$LT$std..process..ChildStdin$u20$as$u20$std..io..Write$GT$5flush17hd1cd00994c0d68a2E (type 6) (param i32 i32)
    local.get 0
    i32.const 3
    i32.store8)
  (func $_ZN3std7process5abort17hf1114be477e68b14E (type 0)
    call $_ZN3std3sys4wasi14abort_internal17h90f7a1074a6bed5aE
    unreachable)
  (func $_ZN3std3sys4wasi14abort_internal17h90f7a1074a6bed5aE (type 0)
    call $abort
    unreachable)
  (func $_ZN70_$LT$std..sync..once..WaiterQueue$u20$as$u20$core..ops..drop..Drop$GT$4drop17h49d83c7df7d961c7E (type 1) (param i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    i32.load
    local.tee 2
    i32.load
    local.set 3
    local.get 2
    local.get 0
    i32.load offset=4
    i32.store
    local.get 1
    local.get 3
    i32.const 3
    i32.and
    local.tee 0
    i32.store offset=12
    block  ;; label = @1
      local.get 0
      i32.const 2
      i32.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.const -4
              i32.and
              local.tee 0
              i32.eqz
              br_if 0 (;@5;)
              loop  ;; label = @6
                local.get 0
                i32.load offset=4
                local.set 2
                local.get 0
                i32.load
                local.set 3
                local.get 0
                i32.const 0
                i32.store
                local.get 3
                i32.eqz
                br_if 2 (;@4;)
                local.get 0
                i32.const 1
                i32.store8 offset=8
                local.get 3
                i32.load offset=24
                local.set 0
                local.get 3
                i32.const 2
                i32.store offset=24
                local.get 1
                local.get 3
                i32.store offset=40
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.const 2
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      br_table 2 (;@7;) 1 (;@8;) 2 (;@7;) 2 (;@7;)
                    end
                    i32.const 1049592
                    i32.const 28
                    i32.const 1049620
                    call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
                    unreachable
                  end
                  local.get 1
                  i32.load offset=40
                  local.tee 0
                  i32.const 28
                  i32.add
                  local.tee 3
                  i32.load
                  local.tee 4
                  i32.load8_u
                  br_if 4 (;@3;)
                  local.get 4
                  i32.const 1
                  i32.store8
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1058352
                      i32.const 1
                      i32.ne
                      br_if 0 (;@9;)
                      i32.const 0
                      i32.load offset=1058356
                      local.set 4
                      br 1 (;@8;)
                    end
                    i32.const 0
                    local.set 4
                    i32.const 0
                    i64.const 1
                    i64.store offset=1058352
                  end
                  i32.const 0
                  local.get 4
                  i32.store offset=1058356
                  local.get 0
                  i32.load8_u offset=32
                  br_if 5 (;@2;)
                  local.get 3
                  i32.load
                  i32.const 0
                  i32.store8
                end
                local.get 1
                i32.load offset=40
                local.tee 0
                local.get 0
                i32.load
                local.tee 0
                i32.const -1
                i32.add
                i32.store
                block  ;; label = @7
                  local.get 0
                  i32.const 1
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 40
                  i32.add
                  call $_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h60f285450f6f3f75E
                end
                local.get 2
                local.set 0
                local.get 2
                br_if 0 (;@6;)
              end
            end
            local.get 1
            i32.const 64
            i32.add
            global.set 0
            return
          end
          i32.const 1049080
          i32.const 43
          i32.const 1050932
          call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
          unreachable
        end
        i32.const 1052192
        i32.const 32
        i32.const 1052260
        call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
        unreachable
      end
      local.get 1
      local.get 3
      i32.store offset=16
      local.get 1
      local.get 4
      i32.const 0
      i32.ne
      i32.store8 offset=20
      i32.const 1049172
      i32.const 43
      local.get 1
      i32.const 16
      i32.add
      i32.const 1049232
      i32.const 1049636
      call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
      unreachable
    end
    local.get 1
    i32.const 52
    i32.add
    i32.const 7
    i32.store
    local.get 1
    i32.const 36
    i32.add
    i32.const 2
    i32.store
    local.get 1
    i64.const 3
    i64.store offset=20 align=4
    local.get 1
    i32.const 1049012
    i32.store offset=16
    local.get 1
    i32.const 7
    i32.store offset=44
    local.get 1
    local.get 1
    i32.const 12
    i32.add
    i32.store offset=56
    local.get 1
    i32.const 1049380
    i32.store offset=60
    local.get 1
    local.get 1
    i32.const 40
    i32.add
    i32.store offset=32
    local.get 1
    local.get 1
    i32.const 60
    i32.add
    i32.store offset=48
    local.get 1
    local.get 1
    i32.const 56
    i32.add
    i32.store offset=40
    local.get 1
    i32.const 16
    i32.add
    i32.const 1050916
    call $_ZN3std9panicking15begin_panic_fmt17h08429981da95e9e5E
    unreachable)
  (func $_ZN91_$LT$std..sys_common..backtrace.._print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$3fmt17hf61cfde2fe9b6125E (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.load8_u
    local.set 3
    local.get 2
    i32.const 40
    i32.add
    i32.const 16
    i32.const 1052388
    i32.const 35
    call $_ZN3std2io5error5Error3new17h241fae668dc94904E
    local.get 2
    i32.load offset=44
    local.set 0
    block  ;; label = @1
      local.get 2
      i32.load8_u offset=40
      i32.const 2
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 4
        i32.load offset=4
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load
        local.get 5
        local.get 4
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 0
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 2
    i32.const 0
    i32.store
    local.get 2
    local.get 3
    i32.store8 offset=12
    local.get 2
    local.get 0
    i64.extend_i32_u
    i64.store offset=4 align=4
    local.get 2
    i32.const 60
    i32.add
    i32.const 0
    i32.store
    local.get 2
    i32.const 1049036
    i32.store offset=56
    local.get 2
    i64.const 1
    i64.store offset=44 align=4
    local.get 2
    i32.const 1051052
    i32.store offset=40
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 2
        i32.const 40
        i32.add
        call $_ZN4core3fmt9Formatter9write_fmt17hdee63efa69c306f6E
        br_if 0 (;@2;)
        local.get 2
        i32.const 16
        i32.add
        local.get 1
        local.get 3
        local.get 2
        i32.const 1051060
        call $_ZN9backtrace5print12BacktraceFmt3new17heb00f4bb3dc7e3fcE
        block  ;; label = @3
          local.get 2
          i32.const 16
          i32.add
          call $_ZN9backtrace5print12BacktraceFmt11add_context17hce465d38752fa7c6E
          br_if 0 (;@3;)
          local.get 2
          i32.const 16
          i32.add
          call $_ZN9backtrace5print12BacktraceFmt11add_context17hce465d38752fa7c6E
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 3
            i32.const 255
            i32.and
            br_if 0 (;@4;)
            local.get 2
            i32.const 60
            i32.add
            i32.const 0
            i32.store
            local.get 2
            i32.const 1049036
            i32.store offset=56
            local.get 2
            i64.const 1
            i64.store offset=44 align=4
            local.get 2
            i32.const 1051168
            i32.store offset=40
            local.get 1
            local.get 2
            i32.const 40
            i32.add
            call $_ZN4core3fmt9Formatter9write_fmt17hdee63efa69c306f6E
            br_if 1 (;@3;)
          end
          block  ;; label = @4
            local.get 2
            i32.load
            local.tee 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.load offset=4
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            i32.const 1
            call $__rust_dealloc
          end
          i32.const 0
          local.set 0
          br 2 (;@1;)
        end
        local.get 2
        i32.load
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 3
        i32.const 1
        call $__rust_dealloc
      end
      i32.const 1
      local.set 0
    end
    local.get 2
    i32.const 64
    i32.add
    global.set 0
    local.get 0)
  (func $_ZN3std10sys_common9backtrace10_print_fmt28_$u7b$$u7b$closure$u7d$$u7d$17hbd37bfd99643a95bE (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        i32.const 1051180
        local.set 2
        i32.const 9
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.const 16
      i32.add
      local.get 2
      i32.load offset=4
      local.get 2
      i32.const 8
      i32.add
      i32.load
      call $_ZN4core3str9from_utf817h4147d06a7789f81eE
      i32.const 1051180
      local.get 3
      i32.load offset=20
      local.get 3
      i32.load offset=16
      i32.const 1
      i32.eq
      local.tee 4
      select
      local.set 2
      i32.const 9
      local.get 3
      i32.const 16
      i32.add
      i32.const 8
      i32.add
      i32.load
      local.get 4
      select
      local.set 4
    end
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    local.get 4
    call $_ZN4core3str5lossy9Utf8Lossy10from_bytes17ha2425d52cb87229aE
    local.get 3
    i32.load offset=8
    local.get 3
    i32.load offset=12
    local.get 1
    call $_ZN66_$LT$core..str..lossy..Utf8Lossy$u20$as$u20$core..fmt..Display$GT$3fmt17hb03f341134eb2e55E
    local.set 2
    local.get 3
    i32.const 32
    i32.add
    global.set 0
    local.get 2)
  (func $_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17h9f16e1c4d331680cE (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.load offset=12
    call_indirect (type 5))
  (func $_ZN3std3sys4wasi7condvar7Condvar4wait17hd58c2e705c9c4c90E (type 6) (param i32 i32)
    i32.const 1052032
    i32.const 29
    i32.const 1052100
    call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
    unreachable)
  (func $_ZN82_$LT$std..sys_common..poison..PoisonError$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h5133a11d5216d05aE (type 3) (param i32 i32) (result i32)
    i32.const 1051232
    i32.const 25
    local.get 1
    call $_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h7843956b8f6f7061E)
  (func $_ZN3std10sys_common4util10dumb_print17h9a7181f517d12afaE (type 1) (param i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 16
    i32.add
    i32.const 16
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 1
    i32.const 16
    i32.add
    i32.const 8
    i32.add
    local.get 0
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 1
    local.get 0
    i64.load align=4
    i64.store offset=16
    local.get 1
    i32.const 8
    i32.add
    local.get 1
    i32.const 40
    i32.add
    local.get 1
    i32.const 16
    i32.add
    call $_ZN3std2io5Write9write_fmt17h509c48398dd5c56bE
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u offset=8
        i32.const 2
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load offset=12
      local.tee 0
      i32.load
      local.get 0
      i32.load offset=4
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 2
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load
        local.get 3
        local.get 2
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 0
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 1
    i32.const 48
    i32.add
    global.set 0)
  (func $_ZN3std10sys_common4util5abort17h4ad11f4843dc8899E (type 1) (param i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 20
    i32.add
    i32.const 1
    i32.store
    local.get 1
    i64.const 2
    i64.store offset=4 align=4
    local.get 1
    i32.const 1051372
    i32.store
    local.get 1
    i32.const 6
    i32.store offset=28
    local.get 1
    local.get 0
    i32.store offset=24
    local.get 1
    local.get 1
    i32.const 24
    i32.add
    i32.store offset=16
    local.get 1
    call $_ZN3std10sys_common4util10dumb_print17h9a7181f517d12afaE
    call $_ZN3std3sys4wasi14abort_internal17h90f7a1074a6bed5aE
    unreachable)
  (func $_ZN3std5alloc24default_alloc_error_hook17h2080d072101c71d6E (type 6) (param i32 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 13
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=20
    local.get 2
    local.get 2
    i32.const 20
    i32.add
    i32.store offset=8
    local.get 2
    i32.const 52
    i32.add
    i32.const 1
    i32.store
    local.get 2
    i64.const 2
    i64.store offset=36 align=4
    local.get 2
    i32.const 1051440
    i32.store offset=32
    local.get 2
    local.get 2
    i32.const 8
    i32.add
    i32.store offset=48
    local.get 2
    i32.const 24
    i32.add
    local.get 2
    i32.const 56
    i32.add
    local.get 2
    i32.const 32
    i32.add
    call $_ZN3std2io5Write9write_fmt17h509c48398dd5c56bE
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        br_if 0 (;@2;)
        local.get 2
        i32.load8_u offset=24
        i32.const 2
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 2
      i32.load offset=28
      local.tee 0
      i32.load
      local.get 0
      i32.load offset=4
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.load offset=4
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load
        local.get 4
        local.get 3
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 0
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 2
    i32.const 64
    i32.add
    global.set 0)
  (func $rust_oom (type 6) (param i32 i32)
    (local i32)
    local.get 0
    local.get 1
    i32.const 0
    i32.load offset=1058292
    local.tee 2
    i32.const 14
    local.get 2
    select
    call_indirect (type 6)
    call $_ZN3std7process5abort17hf1114be477e68b14E
    unreachable)
  (func $__rdl_alloc (type 3) (param i32 i32) (result i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 8
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        i32.le_u
        br_if 1 (;@1;)
      end
      local.get 1
      local.get 0
      call $aligned_alloc
      return
    end
    local.get 0
    call $malloc)
  (func $__rdl_dealloc (type 7) (param i32 i32 i32)
    local.get 0
    call $free)
  (func $__rdl_realloc (type 9) (param i32 i32 i32 i32) (result i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 8
        i32.gt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.le_u
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 2
        local.get 3
        call $aligned_alloc
        local.tee 2
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 2
      local.get 0
      local.get 3
      local.get 1
      local.get 1
      local.get 3
      i32.gt_u
      select
      call $memcpy
      local.set 3
      local.get 0
      call $free
      local.get 3
      return
    end
    local.get 0
    local.get 3
    call $realloc)
  (func $_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h46401a881447bbf1E (type 7) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 20
    i32.add
    i32.const 3
    i32.store
    local.get 3
    i32.const 32
    i32.add
    i32.const 20
    i32.add
    i32.const 15
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 10
    i32.store
    local.get 3
    i64.const 4
    i64.store offset=4 align=4
    local.get 3
    i32.const 1051632
    i32.store
    local.get 3
    i32.const 10
    i32.store offset=36
    local.get 3
    local.get 0
    i32.load offset=8
    i32.store offset=48
    local.get 3
    local.get 0
    i32.load offset=4
    i32.store offset=40
    local.get 3
    local.get 0
    i32.load
    i32.store offset=32
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    i32.const 24
    i32.add
    local.get 1
    local.get 3
    local.get 2
    i32.load offset=36
    local.tee 2
    call_indirect (type 7)
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        br_if 0 (;@2;)
        local.get 3
        i32.load8_u offset=24
        i32.const 2
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 3
      i32.load offset=28
      local.tee 4
      i32.load
      local.get 4
      i32.load offset=4
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 4
        i32.load offset=4
        local.tee 5
        i32.load offset=4
        local.tee 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.load
        local.get 6
        local.get 5
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 4
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load offset=12
            i32.load8_u
            local.tee 4
            i32.const -3
            i32.add
            i32.const 255
            i32.and
            local.tee 0
            i32.const 1
            i32.add
            i32.const 0
            local.get 0
            i32.const 2
            i32.lt_u
            select
            br_table 0 (;@4;) 2 (;@2;) 1 (;@3;) 0 (;@4;)
          end
          i32.const 0
          i32.load8_u offset=1058362
          br_if 2 (;@1;)
          i32.const 0
          i32.const 1
          i32.store8 offset=1058362
          local.get 3
          i32.const 52
          i32.add
          i32.const 1
          i32.store
          local.get 3
          i64.const 1
          i64.store offset=36 align=4
          local.get 3
          i32.const 1050296
          i32.store offset=32
          local.get 3
          i32.const 16
          i32.store offset=4
          local.get 3
          local.get 4
          i32.store8 offset=63
          local.get 3
          local.get 3
          i32.store offset=48
          local.get 3
          local.get 3
          i32.const 63
          i32.add
          i32.store
          local.get 3
          i32.const 24
          i32.add
          local.get 1
          local.get 3
          i32.const 32
          i32.add
          local.get 2
          call_indirect (type 7)
          i32.const 0
          i32.const 0
          i32.store8 offset=1058362
          block  ;; label = @4
            i32.const 0
            br_if 0 (;@4;)
            local.get 3
            i32.load8_u offset=24
            i32.const 2
            i32.ne
            br_if 2 (;@2;)
          end
          local.get 3
          i32.load offset=28
          local.tee 0
          i32.load
          local.get 0
          i32.load offset=4
          i32.load
          call_indirect (type 1)
          block  ;; label = @4
            local.get 0
            i32.load offset=4
            local.tee 1
            i32.load offset=4
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load
            local.get 2
            local.get 1
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 0
          i32.const 12
          i32.const 4
          call $__rust_dealloc
          br 1 (;@2;)
        end
        i32.const 0
        i32.load8_u offset=1058264
        local.set 0
        i32.const 0
        i32.const 0
        i32.store8 offset=1058264
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.const 52
        i32.add
        i32.const 0
        i32.store
        local.get 3
        i32.const 1049036
        i32.store offset=48
        local.get 3
        i64.const 1
        i64.store offset=36 align=4
        local.get 3
        i32.const 1051744
        i32.store offset=32
        local.get 3
        local.get 1
        local.get 3
        i32.const 32
        i32.add
        local.get 2
        call_indirect (type 7)
        block  ;; label = @3
          i32.const 0
          br_if 0 (;@3;)
          local.get 3
          i32.load8_u
          i32.const 2
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 3
        i32.load offset=4
        local.tee 0
        i32.load
        local.get 0
        i32.load offset=4
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 1
          i32.load offset=4
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.load
          local.get 2
          local.get 1
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 0
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 3
      i32.const 64
      i32.add
      global.set 0
      return
    end
    i32.const 1052192
    i32.const 32
    i32.const 1052260
    call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
    unreachable)
  (func $rust_begin_unwind (type 1) (param i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    call $_ZN4core5panic9PanicInfo8location17hd9842140c74e4b5aE
    i32.const 1051752
    call $_ZN4core6option15Option$LT$T$GT$6unwrap17ha9b23444d02fba95E
    local.set 2
    local.get 0
    call $_ZN4core5panic9PanicInfo7message17h173c452a45dbd3bdE
    call $_ZN4core6option15Option$LT$T$GT$6unwrap17h710816bd9632510dE
    local.set 3
    local.get 1
    i32.const 0
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store
    local.get 1
    i32.const 1051784
    local.get 0
    call $_ZN4core5panic9PanicInfo7message17h173c452a45dbd3bdE
    local.get 2
    call $_ZN3std9panicking20rust_panic_with_hook17hb404003726e52692E
    unreachable)
  (func $_ZN3std9panicking20rust_panic_with_hook17hb404003726e52692E (type 4) (param i32 i32 i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 4
    global.set 0
    i32.const 1
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=1058352
            i32.const 1
            i32.eq
            br_if 0 (;@4;)
            i32.const 0
            i64.const 4294967297
            i64.store offset=1058352
            br 1 (;@3;)
          end
          i32.const 0
          i32.const 0
          i32.load offset=1058356
          i32.const 1
          i32.add
          local.tee 5
          i32.store offset=1058356
          local.get 5
          i32.const 2
          i32.gt_u
          br_if 1 (;@2;)
        end
        local.get 4
        local.get 3
        i32.store offset=36
        local.get 4
        local.get 2
        i32.store offset=32
        local.get 4
        i32.const 1049036
        i32.store offset=28
        local.get 4
        i32.const 1049036
        i32.store offset=24
        block  ;; label = @3
          i32.const 0
          i32.load offset=1058296
          local.tee 2
          i32.const -1
          i32.le_s
          br_if 0 (;@3;)
          i32.const 0
          local.get 2
          i32.const 1
          i32.add
          i32.store offset=1058296
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1058304
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1058300
              local.set 3
              local.get 4
              i32.const 16
              i32.add
              local.get 0
              local.get 1
              i32.load offset=16
              call_indirect (type 6)
              local.get 4
              local.get 4
              i64.load offset=16
              i64.store offset=24
              local.get 3
              local.get 4
              i32.const 24
              i32.add
              local.get 2
              i32.load offset=12
              call_indirect (type 6)
              br 1 (;@4;)
            end
            local.get 4
            i32.const 8
            i32.add
            local.get 0
            local.get 1
            i32.load offset=16
            call_indirect (type 6)
            local.get 4
            local.get 4
            i64.load offset=8
            i64.store offset=24
            local.get 4
            i32.const 24
            i32.add
            call $_ZN3std9panicking12default_hook17h98793b832cd2dab6E
          end
          i32.const 0
          i32.const 0
          i32.load offset=1058296
          i32.const -1
          i32.add
          i32.store offset=1058296
          local.get 5
          i32.const 1
          i32.le_u
          br_if 2 (;@1;)
          local.get 4
          i32.const 60
          i32.add
          i32.const 0
          i32.store
          local.get 4
          i32.const 1049036
          i32.store offset=56
          local.get 4
          i64.const 1
          i64.store offset=44 align=4
          local.get 4
          i32.const 1051960
          i32.store offset=40
          local.get 4
          i32.const 40
          i32.add
          call $_ZN3std10sys_common4util10dumb_print17h9a7181f517d12afaE
          unreachable
          unreachable
        end
        local.get 4
        i32.const 60
        i32.add
        i32.const 0
        i32.store
        local.get 4
        i32.const 1049036
        i32.store offset=56
        local.get 4
        i64.const 1
        i64.store offset=44 align=4
        local.get 4
        i32.const 1052380
        i32.store offset=40
        local.get 4
        i32.const 40
        i32.add
        call $_ZN3std10sys_common4util5abort17h4ad11f4843dc8899E
        unreachable
      end
      local.get 4
      i32.const 60
      i32.add
      i32.const 0
      i32.store
      local.get 4
      i32.const 1049036
      i32.store offset=56
      local.get 4
      i64.const 1
      i64.store offset=44 align=4
      local.get 4
      i32.const 1051908
      i32.store offset=40
      local.get 4
      i32.const 40
      i32.add
      call $_ZN3std10sys_common4util10dumb_print17h9a7181f517d12afaE
      unreachable
      unreachable
    end
    local.get 0
    local.get 1
    call $rust_panic
    unreachable)
  (func $_ZN90_$LT$std..panicking..begin_panic_handler..PanicPayload$u20$as$u20$core..panic..BoxMeUp$GT$8take_box17h516f6ed2d13d495aE (type 6) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      local.tee 3
      br_if 0 (;@1;)
      local.get 1
      i32.const 4
      i32.add
      local.set 3
      local.get 1
      i32.load
      local.set 4
      local.get 2
      i32.const 0
      i32.store offset=32
      local.get 2
      i64.const 1
      i64.store offset=24
      local.get 2
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=36
      local.get 2
      i32.const 40
      i32.add
      i32.const 16
      i32.add
      local.get 4
      i32.const 16
      i32.add
      i64.load align=4
      i64.store
      local.get 2
      i32.const 40
      i32.add
      i32.const 8
      i32.add
      local.get 4
      i32.const 8
      i32.add
      i64.load align=4
      i64.store
      local.get 2
      local.get 4
      i64.load align=4
      i64.store offset=40
      local.get 2
      i32.const 36
      i32.add
      i32.const 1048680
      local.get 2
      i32.const 40
      i32.add
      call $_ZN4core3fmt5write17hf78275652148e08fE
      drop
      local.get 2
      i32.const 8
      i32.add
      i32.const 8
      i32.add
      local.tee 4
      local.get 2
      i32.load offset=32
      i32.store
      local.get 2
      local.get 2
      i64.load offset=24
      i64.store offset=8
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 8
        i32.add
        i32.load
        local.tee 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        local.get 6
        i32.const 1
        call $__rust_dealloc
      end
      local.get 3
      local.get 2
      i64.load offset=8
      i64.store align=4
      local.get 3
      i32.const 8
      i32.add
      local.get 4
      i32.load
      i32.store
      local.get 3
      i32.load
      local.set 3
    end
    local.get 1
    i32.const 1
    i32.store offset=4
    local.get 1
    i32.const 12
    i32.add
    i32.load
    local.set 4
    local.get 1
    i32.const 8
    i32.add
    local.tee 1
    i32.load
    local.set 5
    local.get 1
    i64.const 0
    i64.store align=4
    block  ;; label = @1
      i32.const 12
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 12
      i32.const 4
      call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
      unreachable
    end
    local.get 1
    local.get 4
    i32.store offset=8
    local.get 1
    local.get 5
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store
    local.get 0
    i32.const 1051804
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 64
    i32.add
    global.set 0)
  (func $_ZN90_$LT$std..panicking..begin_panic_handler..PanicPayload$u20$as$u20$core..panic..BoxMeUp$GT$3get17h0dcd379042aba638E (type 6) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 2
    global.set 0
    local.get 1
    i32.const 4
    i32.add
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      br_if 0 (;@1;)
      local.get 1
      i32.load
      local.set 4
      local.get 2
      i32.const 0
      i32.store offset=32
      local.get 2
      i64.const 1
      i64.store offset=24
      local.get 2
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=36
      local.get 2
      i32.const 40
      i32.add
      i32.const 16
      i32.add
      local.get 4
      i32.const 16
      i32.add
      i64.load align=4
      i64.store
      local.get 2
      i32.const 40
      i32.add
      i32.const 8
      i32.add
      local.get 4
      i32.const 8
      i32.add
      i64.load align=4
      i64.store
      local.get 2
      local.get 4
      i64.load align=4
      i64.store offset=40
      local.get 2
      i32.const 36
      i32.add
      i32.const 1048680
      local.get 2
      i32.const 40
      i32.add
      call $_ZN4core3fmt5write17hf78275652148e08fE
      drop
      local.get 2
      i32.const 8
      i32.add
      i32.const 8
      i32.add
      local.tee 4
      local.get 2
      i32.load offset=32
      i32.store
      local.get 2
      local.get 2
      i64.load offset=24
      i64.store offset=8
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 8
        i32.add
        i32.load
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        local.get 1
        i32.const 1
        call $__rust_dealloc
      end
      local.get 3
      local.get 2
      i64.load offset=8
      i64.store align=4
      local.get 3
      i32.const 8
      i32.add
      local.get 4
      i32.load
      i32.store
    end
    local.get 0
    i32.const 1051804
    i32.store offset=4
    local.get 0
    local.get 3
    i32.store
    local.get 2
    i32.const 64
    i32.add
    global.set 0)
  (func $_ZN91_$LT$std..panicking..begin_panic..PanicPayload$LT$A$GT$$u20$as$u20$core..panic..BoxMeUp$GT$8take_box17hf6fdacb60f80e8b3E (type 6) (param i32 i32)
    (local i32 i32)
    local.get 1
    i32.load
    local.set 2
    local.get 1
    i32.const 0
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=4
        local.set 3
        i32.const 8
        i32.const 4
        call $__rust_alloc
        local.tee 1
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 3
        i32.store offset=4
        local.get 1
        local.get 2
        i32.store
        local.get 0
        i32.const 1051840
        i32.store offset=4
        local.get 0
        local.get 1
        i32.store
        return
      end
      call $_ZN3std7process5abort17hf1114be477e68b14E
      unreachable
    end
    i32.const 8
    i32.const 4
    call $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E
    unreachable)
  (func $_ZN91_$LT$std..panicking..begin_panic..PanicPayload$LT$A$GT$$u20$as$u20$core..panic..BoxMeUp$GT$3get17h3853a323bdd12366E (type 6) (param i32 i32)
    block  ;; label = @1
      local.get 1
      i32.load
      br_if 0 (;@1;)
      call $_ZN3std7process5abort17hf1114be477e68b14E
      unreachable
    end
    local.get 0
    i32.const 1051840
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $rust_panic (type 6) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 0
    i32.store
    local.get 2
    local.get 2
    call $__rust_start_panic
    i32.store offset=12
    local.get 2
    i32.const 36
    i32.add
    i32.const 1
    i32.store
    local.get 2
    i64.const 1
    i64.store offset=20 align=4
    local.get 2
    i32.const 1052000
    i32.store offset=16
    local.get 2
    i32.const 13
    i32.store offset=44
    local.get 2
    local.get 2
    i32.const 40
    i32.add
    i32.store offset=32
    local.get 2
    local.get 2
    i32.const 12
    i32.add
    i32.store offset=40
    local.get 2
    i32.const 16
    i32.add
    call $_ZN3std10sys_common4util5abort17h4ad11f4843dc8899E
    unreachable)
  (func $_ZN3std2rt19lang_start_internal17h671cbf6e632f7250E (type 9) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 4
            i32.const 1
            call $__rust_alloc
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i64.const 4
            i64.store offset=20 align=4
            local.get 4
            local.get 5
            i32.store offset=16
            local.get 4
            i32.const 16
            i32.add
            i32.const 4
            call $_ZN5alloc3vec12Vec$LT$T$GT$7reserve17heda78ba2e93e6ddbE
            local.get 4
            i32.load offset=16
            local.get 4
            i32.load offset=24
            local.tee 5
            i32.add
            i32.const 1852399981
            i32.store align=1
            local.get 4
            i32.const 8
            i32.add
            local.get 5
            i32.const 4
            i32.add
            i32.store
            local.get 4
            local.get 4
            i64.load offset=16
            i64.store
            local.get 4
            call $_ZN3std6thread6Thread3new17hcdd908459063ea43E
            local.set 5
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=1058340
                i32.const 1
                i32.eq
                br_if 0 (;@6;)
                i32.const 0
                i64.const 1
                i64.store offset=1058340 align=4
                i32.const 0
                i32.const 0
                i32.store offset=1058348
                br 1 (;@5;)
              end
              i32.const 0
              i32.load offset=1058344
              local.tee 6
              i32.const 1
              i32.add
              i32.const 0
              i32.le_s
              br_if 2 (;@3;)
              i32.const 0
              i32.load offset=1058348
              br_if 3 (;@2;)
              local.get 6
              br_if 4 (;@1;)
            end
            i32.const 0
            local.get 5
            i32.store offset=1058348
            i32.const 0
            i32.const 0
            i32.store offset=1058344
            local.get 0
            local.get 1
            call $_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17h9f16e1c4d331680cE
            local.set 0
            block  ;; label = @5
              i32.const 0
              i32.load offset=1058288
              i32.const 3
              i32.eq
              br_if 0 (;@5;)
              local.get 4
              i32.const 1
              i32.store8
              local.get 4
              local.get 4
              i32.store offset=16
              i32.const 1058288
              i32.const 0
              local.get 4
              i32.const 16
              i32.add
              i32.const 1050720
              call $_ZN3std4sync4once4Once10call_inner17hca77e4a078ff76abE
            end
            local.get 4
            i32.const 32
            i32.add
            global.set 0
            local.get 0
            return
          end
          i32.const 4
          i32.const 1
          call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h1ab5c239c842986eE
          unreachable
        end
        i32.const 1048912
        i32.const 24
        local.get 4
        i32.const 16
        i32.add
        i32.const 1049124
        i32.const 1048936
        call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
        unreachable
      end
      i32.const 1051293
      i32.const 38
      i32.const 1051332
      call $_ZN3std9panicking11begin_panic17h2ebaa03187c3c1cfE
      unreachable
    end
    i32.const 1048812
    i32.const 16
    local.get 4
    i32.const 16
    i32.add
    i32.const 1049140
    i32.const 1048896
    call $_ZN4core6option18expect_none_failed17h959c69efc793a13dE
    unreachable)
  (func $_ZN62_$LT$std..ffi..c_str..NulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h62d3c8deb4a47d04E (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i32.const 1052008
    i32.const 8
    call $_ZN4core3fmt9Formatter11debug_tuple17hafbe9eaebee7e85bE
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 2
    i32.const 12
    i32.add
    i32.const 1049284
    call $_ZN4core3fmt8builders10DebugTuple5field17ha8d7daf60661e76bE
    drop
    local.get 2
    local.get 0
    i32.const 4
    i32.add
    i32.store offset=12
    local.get 2
    local.get 2
    i32.const 12
    i32.add
    i32.const 1052016
    call $_ZN4core3fmt8builders10DebugTuple5field17ha8d7daf60661e76bE
    drop
    local.get 2
    call $_ZN4core3fmt8builders10DebugTuple6finish17hf5054e572dd32ba2E
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func $_ZN3std3sys4wasi7process8ExitCode6as_i3217ha6343d4419ced070E (type 5) (param i32) (result i32)
    local.get 0
    i32.load8_u)
  (func $__rust_start_panic (type 5) (param i32) (result i32)
    unreachable
    unreachable)
  (func $_ZN4wasi5error5Error9raw_error17hf4fc4403a50dba6eE (type 5) (param i32) (result i32)
    local.get 0
    i32.load16_u)
  (func $_ZN4wasi13lib_generated8fd_write17h88522743b3c41194E (type 4) (param i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 2
        local.get 3
        local.get 4
        i32.const 12
        i32.add
        call $_ZN4wasi13lib_generated22wasi_snapshot_preview18fd_write17hfbffe82bfc68da68E
        local.tee 1
        br_if 0 (;@2;)
        local.get 0
        i32.const 4
        i32.add
        local.get 4
        i32.load offset=12
        i32.store
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      local.get 1
      i32.store16 offset=2
      i32.const 1
      local.set 1
    end
    local.get 0
    local.get 1
    i32.store16
    local.get 4
    i32.const 16
    i32.add
    global.set 0)
  (func $_ZN9backtrace5print12BacktraceFmt3new17heb00f4bb3dc7e3fcE (type 10) (param i32 i32 i32 i32 i32)
    local.get 0
    local.get 2
    i32.store8 offset=16
    local.get 0
    i32.const 0
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 0
    i32.const 12
    i32.add
    local.get 4
    i32.store)
  (func $_ZN9backtrace5print12BacktraceFmt11add_context17hce465d38752fa7c6E (type 5) (param i32) (result i32)
    i32.const 0)
  (func $abort (type 0)
    unreachable
    unreachable)
  (func $malloc (type 5) (param i32) (result i32)
    local.get 0
    call $dlmalloc)
  (func $dlmalloc (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.const 236
                            i32.gt_u
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1058364
                              local.tee 2
                              i32.const 16
                              local.get 0
                              i32.const 19
                              i32.add
                              i32.const -16
                              i32.and
                              local.get 0
                              i32.const 11
                              i32.lt_u
                              select
                              local.tee 3
                              i32.const 3
                              i32.shr_u
                              local.tee 4
                              i32.shr_u
                              local.tee 0
                              i32.const 3
                              i32.and
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 1
                              i32.and
                              local.get 4
                              i32.or
                              i32.const 1
                              i32.xor
                              local.tee 3
                              i32.const 3
                              i32.shl
                              local.tee 5
                              i32.const 1058412
                              i32.add
                              i32.load
                              local.tee 4
                              i32.const 8
                              i32.add
                              local.set 0
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 4
                                  i32.load offset=8
                                  local.tee 6
                                  local.get 5
                                  i32.const 1058404
                                  i32.add
                                  local.tee 5
                                  i32.ne
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.get 2
                                  i32.const -2
                                  local.get 3
                                  i32.rotl
                                  i32.and
                                  i32.store offset=1058364
                                  br 1 (;@14;)
                                end
                                i32.const 0
                                i32.load offset=1058380
                                local.get 6
                                i32.gt_u
                                drop
                                local.get 5
                                local.get 6
                                i32.store offset=8
                                local.get 6
                                local.get 5
                                i32.store offset=12
                              end
                              local.get 4
                              local.get 3
                              i32.const 3
                              i32.shl
                              local.tee 6
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 4
                              local.get 6
                              i32.add
                              local.tee 4
                              local.get 4
                              i32.load offset=4
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              br 12 (;@1;)
                            end
                            local.get 3
                            i32.const 0
                            i32.load offset=1058372
                            local.tee 7
                            i32.le_u
                            br_if 1 (;@11;)
                            block  ;; label = @13
                              local.get 0
                              i32.eqz
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 0
                                  local.get 4
                                  i32.shl
                                  i32.const 2
                                  local.get 4
                                  i32.shl
                                  local.tee 0
                                  i32.const 0
                                  local.get 0
                                  i32.sub
                                  i32.or
                                  i32.and
                                  local.tee 0
                                  i32.const 0
                                  local.get 0
                                  i32.sub
                                  i32.and
                                  i32.const -1
                                  i32.add
                                  local.tee 0
                                  local.get 0
                                  i32.const 12
                                  i32.shr_u
                                  i32.const 16
                                  i32.and
                                  local.tee 0
                                  i32.shr_u
                                  local.tee 4
                                  i32.const 5
                                  i32.shr_u
                                  i32.const 8
                                  i32.and
                                  local.tee 6
                                  local.get 0
                                  i32.or
                                  local.get 4
                                  local.get 6
                                  i32.shr_u
                                  local.tee 0
                                  i32.const 2
                                  i32.shr_u
                                  i32.const 4
                                  i32.and
                                  local.tee 4
                                  i32.or
                                  local.get 0
                                  local.get 4
                                  i32.shr_u
                                  local.tee 0
                                  i32.const 1
                                  i32.shr_u
                                  i32.const 2
                                  i32.and
                                  local.tee 4
                                  i32.or
                                  local.get 0
                                  local.get 4
                                  i32.shr_u
                                  local.tee 0
                                  i32.const 1
                                  i32.shr_u
                                  i32.const 1
                                  i32.and
                                  local.tee 4
                                  i32.or
                                  local.get 0
                                  local.get 4
                                  i32.shr_u
                                  i32.add
                                  local.tee 6
                                  i32.const 3
                                  i32.shl
                                  local.tee 5
                                  i32.const 1058412
                                  i32.add
                                  i32.load
                                  local.tee 4
                                  i32.load offset=8
                                  local.tee 0
                                  local.get 5
                                  i32.const 1058404
                                  i32.add
                                  local.tee 5
                                  i32.ne
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.get 2
                                  i32.const -2
                                  local.get 6
                                  i32.rotl
                                  i32.and
                                  local.tee 2
                                  i32.store offset=1058364
                                  br 1 (;@14;)
                                end
                                i32.const 0
                                i32.load offset=1058380
                                local.get 0
                                i32.gt_u
                                drop
                                local.get 5
                                local.get 0
                                i32.store offset=8
                                local.get 0
                                local.get 5
                                i32.store offset=12
                              end
                              local.get 4
                              i32.const 8
                              i32.add
                              local.set 0
                              local.get 4
                              local.get 3
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 4
                              local.get 6
                              i32.const 3
                              i32.shl
                              local.tee 6
                              i32.add
                              local.get 6
                              local.get 3
                              i32.sub
                              local.tee 6
                              i32.store
                              local.get 4
                              local.get 3
                              i32.add
                              local.tee 5
                              local.get 6
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              block  ;; label = @14
                                local.get 7
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 7
                                i32.const 3
                                i32.shr_u
                                local.tee 8
                                i32.const 3
                                i32.shl
                                i32.const 1058404
                                i32.add
                                local.set 3
                                i32.const 0
                                i32.load offset=1058384
                                local.set 4
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 2
                                    i32.const 1
                                    local.get 8
                                    i32.shl
                                    local.tee 8
                                    i32.and
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.get 2
                                    local.get 8
                                    i32.or
                                    i32.store offset=1058364
                                    local.get 3
                                    local.set 8
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.load offset=8
                                  local.set 8
                                end
                                local.get 8
                                local.get 4
                                i32.store offset=12
                                local.get 3
                                local.get 4
                                i32.store offset=8
                                local.get 4
                                local.get 3
                                i32.store offset=12
                                local.get 4
                                local.get 8
                                i32.store offset=8
                              end
                              i32.const 0
                              local.get 5
                              i32.store offset=1058384
                              i32.const 0
                              local.get 6
                              i32.store offset=1058372
                              br 12 (;@1;)
                            end
                            i32.const 0
                            i32.load offset=1058368
                            local.tee 9
                            i32.eqz
                            br_if 1 (;@11;)
                            local.get 9
                            i32.const 0
                            local.get 9
                            i32.sub
                            i32.and
                            i32.const -1
                            i32.add
                            local.tee 0
                            local.get 0
                            i32.const 12
                            i32.shr_u
                            i32.const 16
                            i32.and
                            local.tee 0
                            i32.shr_u
                            local.tee 4
                            i32.const 5
                            i32.shr_u
                            i32.const 8
                            i32.and
                            local.tee 6
                            local.get 0
                            i32.or
                            local.get 4
                            local.get 6
                            i32.shr_u
                            local.tee 0
                            i32.const 2
                            i32.shr_u
                            i32.const 4
                            i32.and
                            local.tee 4
                            i32.or
                            local.get 0
                            local.get 4
                            i32.shr_u
                            local.tee 0
                            i32.const 1
                            i32.shr_u
                            i32.const 2
                            i32.and
                            local.tee 4
                            i32.or
                            local.get 0
                            local.get 4
                            i32.shr_u
                            local.tee 0
                            i32.const 1
                            i32.shr_u
                            i32.const 1
                            i32.and
                            local.tee 4
                            i32.or
                            local.get 0
                            local.get 4
                            i32.shr_u
                            i32.add
                            i32.const 2
                            i32.shl
                            i32.const 1058668
                            i32.add
                            i32.load
                            local.tee 5
                            i32.load offset=4
                            i32.const -8
                            i32.and
                            local.get 3
                            i32.sub
                            local.set 4
                            local.get 5
                            local.set 6
                            block  ;; label = @13
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 6
                                  i32.load offset=16
                                  local.tee 0
                                  br_if 0 (;@15;)
                                  local.get 6
                                  i32.const 20
                                  i32.add
                                  i32.load
                                  local.tee 0
                                  i32.eqz
                                  br_if 2 (;@13;)
                                end
                                local.get 0
                                i32.load offset=4
                                i32.const -8
                                i32.and
                                local.get 3
                                i32.sub
                                local.tee 6
                                local.get 4
                                local.get 6
                                local.get 4
                                i32.lt_u
                                local.tee 6
                                select
                                local.set 4
                                local.get 0
                                local.get 5
                                local.get 6
                                select
                                local.set 5
                                local.get 0
                                local.set 6
                                br 0 (;@14;)
                              end
                            end
                            local.get 5
                            i32.load offset=24
                            local.set 10
                            block  ;; label = @13
                              local.get 5
                              i32.load offset=12
                              local.tee 8
                              local.get 5
                              i32.eq
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                i32.const 0
                                i32.load offset=1058380
                                local.get 5
                                i32.load offset=8
                                local.tee 0
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 0
                                i32.load offset=12
                                local.get 5
                                i32.ne
                                drop
                              end
                              local.get 8
                              local.get 0
                              i32.store offset=8
                              local.get 0
                              local.get 8
                              i32.store offset=12
                              br 11 (;@2;)
                            end
                            block  ;; label = @13
                              local.get 5
                              i32.const 20
                              i32.add
                              local.tee 6
                              i32.load
                              local.tee 0
                              br_if 0 (;@13;)
                              local.get 5
                              i32.load offset=16
                              local.tee 0
                              i32.eqz
                              br_if 3 (;@10;)
                              local.get 5
                              i32.const 16
                              i32.add
                              local.set 6
                            end
                            loop  ;; label = @13
                              local.get 6
                              local.set 11
                              local.get 0
                              local.tee 8
                              i32.const 20
                              i32.add
                              local.tee 6
                              i32.load
                              local.tee 0
                              br_if 0 (;@13;)
                              local.get 8
                              i32.const 16
                              i32.add
                              local.set 6
                              local.get 8
                              i32.load offset=16
                              local.tee 0
                              br_if 0 (;@13;)
                            end
                            local.get 11
                            i32.const 0
                            i32.store
                            br 10 (;@2;)
                          end
                          i32.const -1
                          local.set 3
                          local.get 0
                          i32.const -65
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 19
                          i32.add
                          local.tee 0
                          i32.const -16
                          i32.and
                          local.set 3
                          i32.const 0
                          i32.load offset=1058368
                          local.tee 7
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 11
                          block  ;; label = @12
                            local.get 0
                            i32.const 8
                            i32.shr_u
                            local.tee 0
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 31
                            local.set 11
                            local.get 3
                            i32.const 16777215
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 0
                            i32.const 1048320
                            i32.add
                            i32.const 16
                            i32.shr_u
                            i32.const 8
                            i32.and
                            local.tee 4
                            i32.shl
                            local.tee 0
                            local.get 0
                            i32.const 520192
                            i32.add
                            i32.const 16
                            i32.shr_u
                            i32.const 4
                            i32.and
                            local.tee 0
                            i32.shl
                            local.tee 6
                            local.get 6
                            i32.const 245760
                            i32.add
                            i32.const 16
                            i32.shr_u
                            i32.const 2
                            i32.and
                            local.tee 6
                            i32.shl
                            i32.const 15
                            i32.shr_u
                            local.get 0
                            local.get 4
                            i32.or
                            local.get 6
                            i32.or
                            i32.sub
                            local.tee 0
                            i32.const 1
                            i32.shl
                            local.get 3
                            local.get 0
                            i32.const 21
                            i32.add
                            i32.shr_u
                            i32.const 1
                            i32.and
                            i32.or
                            i32.const 28
                            i32.add
                            local.set 11
                          end
                          i32.const 0
                          local.get 3
                          i32.sub
                          local.set 6
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 11
                                  i32.const 2
                                  i32.shl
                                  i32.const 1058668
                                  i32.add
                                  i32.load
                                  local.tee 4
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 0
                                  i32.const 0
                                  local.set 8
                                  br 1 (;@14;)
                                end
                                local.get 3
                                i32.const 0
                                i32.const 25
                                local.get 11
                                i32.const 1
                                i32.shr_u
                                i32.sub
                                local.get 11
                                i32.const 31
                                i32.eq
                                select
                                i32.shl
                                local.set 5
                                i32.const 0
                                local.set 0
                                i32.const 0
                                local.set 8
                                loop  ;; label = @15
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=4
                                    i32.const -8
                                    i32.and
                                    local.get 3
                                    i32.sub
                                    local.tee 2
                                    local.get 6
                                    i32.ge_u
                                    br_if 0 (;@16;)
                                    local.get 2
                                    local.set 6
                                    local.get 4
                                    local.set 8
                                    local.get 2
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 6
                                    local.get 4
                                    local.set 8
                                    local.get 4
                                    local.set 0
                                    br 3 (;@13;)
                                  end
                                  local.get 0
                                  local.get 4
                                  i32.const 20
                                  i32.add
                                  i32.load
                                  local.tee 2
                                  local.get 2
                                  local.get 4
                                  local.get 5
                                  i32.const 29
                                  i32.shr_u
                                  i32.const 4
                                  i32.and
                                  i32.add
                                  i32.const 16
                                  i32.add
                                  i32.load
                                  local.tee 4
                                  i32.eq
                                  select
                                  local.get 0
                                  local.get 2
                                  select
                                  local.set 0
                                  local.get 5
                                  local.get 4
                                  i32.const 0
                                  i32.ne
                                  i32.shl
                                  local.set 5
                                  local.get 4
                                  br_if 0 (;@15;)
                                end
                              end
                              block  ;; label = @14
                                local.get 0
                                local.get 8
                                i32.or
                                br_if 0 (;@14;)
                                i32.const 2
                                local.get 11
                                i32.shl
                                local.tee 0
                                i32.const 0
                                local.get 0
                                i32.sub
                                i32.or
                                local.get 7
                                i32.and
                                local.tee 0
                                i32.eqz
                                br_if 3 (;@11;)
                                local.get 0
                                i32.const 0
                                local.get 0
                                i32.sub
                                i32.and
                                i32.const -1
                                i32.add
                                local.tee 0
                                local.get 0
                                i32.const 12
                                i32.shr_u
                                i32.const 16
                                i32.and
                                local.tee 0
                                i32.shr_u
                                local.tee 4
                                i32.const 5
                                i32.shr_u
                                i32.const 8
                                i32.and
                                local.tee 5
                                local.get 0
                                i32.or
                                local.get 4
                                local.get 5
                                i32.shr_u
                                local.tee 0
                                i32.const 2
                                i32.shr_u
                                i32.const 4
                                i32.and
                                local.tee 4
                                i32.or
                                local.get 0
                                local.get 4
                                i32.shr_u
                                local.tee 0
                                i32.const 1
                                i32.shr_u
                                i32.const 2
                                i32.and
                                local.tee 4
                                i32.or
                                local.get 0
                                local.get 4
                                i32.shr_u
                                local.tee 0
                                i32.const 1
                                i32.shr_u
                                i32.const 1
                                i32.and
                                local.tee 4
                                i32.or
                                local.get 0
                                local.get 4
                                i32.shr_u
                                i32.add
                                i32.const 2
                                i32.shl
                                i32.const 1058668
                                i32.add
                                i32.load
                                local.set 0
                              end
                              local.get 0
                              i32.eqz
                              br_if 1 (;@12;)
                            end
                            loop  ;; label = @13
                              local.get 0
                              i32.load offset=4
                              i32.const -8
                              i32.and
                              local.get 3
                              i32.sub
                              local.tee 2
                              local.get 6
                              i32.lt_u
                              local.set 5
                              block  ;; label = @14
                                local.get 0
                                i32.load offset=16
                                local.tee 4
                                br_if 0 (;@14;)
                                local.get 0
                                i32.const 20
                                i32.add
                                i32.load
                                local.set 4
                              end
                              local.get 2
                              local.get 6
                              local.get 5
                              select
                              local.set 6
                              local.get 0
                              local.get 8
                              local.get 5
                              select
                              local.set 8
                              local.get 4
                              local.set 0
                              local.get 4
                              br_if 0 (;@13;)
                            end
                          end
                          local.get 8
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 6
                          i32.const 0
                          i32.load offset=1058372
                          local.get 3
                          i32.sub
                          i32.ge_u
                          br_if 0 (;@11;)
                          local.get 8
                          i32.load offset=24
                          local.set 11
                          block  ;; label = @12
                            local.get 8
                            i32.load offset=12
                            local.tee 5
                            local.get 8
                            i32.eq
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1058380
                              local.get 8
                              i32.load offset=8
                              local.tee 0
                              i32.gt_u
                              br_if 0 (;@13;)
                              local.get 0
                              i32.load offset=12
                              local.get 8
                              i32.ne
                              drop
                            end
                            local.get 5
                            local.get 0
                            i32.store offset=8
                            local.get 0
                            local.get 5
                            i32.store offset=12
                            br 9 (;@3;)
                          end
                          block  ;; label = @12
                            local.get 8
                            i32.const 20
                            i32.add
                            local.tee 4
                            i32.load
                            local.tee 0
                            br_if 0 (;@12;)
                            local.get 8
                            i32.load offset=16
                            local.tee 0
                            i32.eqz
                            br_if 3 (;@9;)
                            local.get 8
                            i32.const 16
                            i32.add
                            local.set 4
                          end
                          loop  ;; label = @12
                            local.get 4
                            local.set 2
                            local.get 0
                            local.tee 5
                            i32.const 20
                            i32.add
                            local.tee 4
                            i32.load
                            local.tee 0
                            br_if 0 (;@12;)
                            local.get 5
                            i32.const 16
                            i32.add
                            local.set 4
                            local.get 5
                            i32.load offset=16
                            local.tee 0
                            br_if 0 (;@12;)
                          end
                          local.get 2
                          i32.const 0
                          i32.store
                          br 8 (;@3;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1058372
                          local.tee 0
                          local.get 3
                          i32.lt_u
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=1058384
                          local.set 4
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 0
                              local.get 3
                              i32.sub
                              local.tee 6
                              i32.const 16
                              i32.lt_u
                              br_if 0 (;@13;)
                              local.get 4
                              local.get 3
                              i32.add
                              local.tee 5
                              local.get 6
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              i32.const 0
                              local.get 6
                              i32.store offset=1058372
                              i32.const 0
                              local.get 5
                              i32.store offset=1058384
                              local.get 4
                              local.get 0
                              i32.add
                              local.get 6
                              i32.store
                              local.get 4
                              local.get 3
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              br 1 (;@12;)
                            end
                            local.get 4
                            local.get 0
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 4
                            local.get 0
                            i32.add
                            local.tee 0
                            local.get 0
                            i32.load offset=4
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            i32.const 0
                            i32.const 0
                            i32.store offset=1058384
                            i32.const 0
                            i32.const 0
                            i32.store offset=1058372
                          end
                          local.get 4
                          i32.const 8
                          i32.add
                          local.set 0
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1058376
                          local.tee 5
                          local.get 3
                          i32.le_u
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=1058388
                          local.tee 0
                          local.get 3
                          i32.add
                          local.tee 4
                          local.get 5
                          local.get 3
                          i32.sub
                          local.tee 6
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          i32.const 0
                          local.get 6
                          i32.store offset=1058376
                          i32.const 0
                          local.get 4
                          i32.store offset=1058388
                          local.get 0
                          local.get 3
                          i32.const 3
                          i32.or
                          i32.store offset=4
                          local.get 0
                          i32.const 8
                          i32.add
                          local.set 0
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1058836
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.load offset=1058844
                            local.set 4
                            br 1 (;@11;)
                          end
                          i32.const 0
                          i64.const -1
                          i64.store offset=1058848 align=4
                          i32.const 0
                          i64.const 281474976776192
                          i64.store offset=1058840 align=4
                          i32.const 0
                          local.get 1
                          i32.const 12
                          i32.add
                          i32.const -16
                          i32.and
                          i32.const 1431655768
                          i32.xor
                          i32.store offset=1058836
                          i32.const 0
                          i32.const 0
                          i32.store offset=1058856
                          i32.const 0
                          i32.const 0
                          i32.store offset=1058808
                          i32.const 65536
                          local.set 4
                        end
                        i32.const 0
                        local.set 0
                        block  ;; label = @11
                          local.get 4
                          local.get 3
                          i32.const 71
                          i32.add
                          local.tee 7
                          i32.add
                          local.tee 2
                          i32.const 0
                          local.get 4
                          i32.sub
                          local.tee 11
                          i32.and
                          local.tee 8
                          local.get 3
                          i32.gt_u
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.const 48
                          i32.store offset=1058860
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1058804
                          local.tee 0
                          i32.eqz
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1058796
                            local.tee 4
                            local.get 8
                            i32.add
                            local.tee 6
                            local.get 4
                            i32.le_u
                            br_if 0 (;@12;)
                            local.get 6
                            local.get 0
                            i32.le_u
                            br_if 1 (;@11;)
                          end
                          i32.const 0
                          local.set 0
                          i32.const 0
                          i32.const 48
                          i32.store offset=1058860
                          br 10 (;@1;)
                        end
                        i32.const 0
                        i32.load8_u offset=1058808
                        i32.const 4
                        i32.and
                        br_if 4 (;@6;)
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1058388
                              local.tee 4
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 1058812
                              local.set 0
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 0
                                  i32.load
                                  local.tee 6
                                  local.get 4
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                  local.get 6
                                  local.get 0
                                  i32.load offset=4
                                  i32.add
                                  local.get 4
                                  i32.gt_u
                                  br_if 3 (;@12;)
                                end
                                local.get 0
                                i32.load offset=8
                                local.tee 0
                                br_if 0 (;@14;)
                              end
                            end
                            i32.const 0
                            call $sbrk
                            local.tee 5
                            i32.const -1
                            i32.eq
                            br_if 5 (;@7;)
                            local.get 8
                            local.set 2
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1058840
                              local.tee 0
                              i32.const -1
                              i32.add
                              local.tee 4
                              local.get 5
                              i32.and
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 8
                              local.get 5
                              i32.sub
                              local.get 4
                              local.get 5
                              i32.add
                              i32.const 0
                              local.get 0
                              i32.sub
                              i32.and
                              i32.add
                              local.set 2
                            end
                            local.get 2
                            local.get 3
                            i32.le_u
                            br_if 5 (;@7;)
                            local.get 2
                            i32.const 2147483646
                            i32.gt_u
                            br_if 5 (;@7;)
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1058804
                              local.tee 0
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.load offset=1058796
                              local.tee 4
                              local.get 2
                              i32.add
                              local.tee 6
                              local.get 4
                              i32.le_u
                              br_if 6 (;@7;)
                              local.get 6
                              local.get 0
                              i32.gt_u
                              br_if 6 (;@7;)
                            end
                            local.get 2
                            call $sbrk
                            local.tee 0
                            local.get 5
                            i32.ne
                            br_if 1 (;@11;)
                            br 7 (;@5;)
                          end
                          local.get 2
                          local.get 5
                          i32.sub
                          local.get 11
                          i32.and
                          local.tee 2
                          i32.const 2147483646
                          i32.gt_u
                          br_if 4 (;@7;)
                          local.get 2
                          call $sbrk
                          local.tee 5
                          local.get 0
                          i32.load
                          local.get 0
                          i32.load offset=4
                          i32.add
                          i32.eq
                          br_if 3 (;@8;)
                          local.get 5
                          local.set 0
                        end
                        local.get 0
                        local.set 5
                        block  ;; label = @11
                          local.get 3
                          i32.const 72
                          i32.add
                          local.get 2
                          i32.le_u
                          br_if 0 (;@11;)
                          local.get 2
                          i32.const 2147483646
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const -1
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 7
                          local.get 2
                          i32.sub
                          i32.const 0
                          i32.load offset=1058844
                          local.tee 0
                          i32.add
                          i32.const 0
                          local.get 0
                          i32.sub
                          i32.and
                          local.tee 0
                          i32.const 2147483646
                          i32.gt_u
                          br_if 6 (;@5;)
                          block  ;; label = @12
                            local.get 0
                            call $sbrk
                            i32.const -1
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 2
                            i32.add
                            local.set 2
                            br 7 (;@5;)
                          end
                          i32.const 0
                          local.get 2
                          i32.sub
                          call $sbrk
                          drop
                          br 4 (;@7;)
                        end
                        local.get 5
                        i32.const -1
                        i32.ne
                        br_if 5 (;@5;)
                        br 3 (;@7;)
                      end
                      i32.const 0
                      local.set 8
                      br 7 (;@2;)
                    end
                    i32.const 0
                    local.set 5
                    br 5 (;@3;)
                  end
                  local.get 5
                  i32.const -1
                  i32.ne
                  br_if 2 (;@5;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=1058808
                i32.const 4
                i32.or
                i32.store offset=1058808
              end
              local.get 8
              i32.const 2147483646
              i32.gt_u
              br_if 1 (;@4;)
              local.get 8
              call $sbrk
              local.tee 5
              i32.const 0
              call $sbrk
              local.tee 0
              i32.ge_u
              br_if 1 (;@4;)
              local.get 5
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              local.get 5
              i32.sub
              local.tee 2
              local.get 3
              i32.const 56
              i32.add
              i32.le_u
              br_if 1 (;@4;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=1058796
            local.get 2
            i32.add
            local.tee 0
            i32.store offset=1058796
            block  ;; label = @5
              local.get 0
              i32.const 0
              i32.load offset=1058800
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.get 0
              i32.store offset=1058800
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1058388
                    local.tee 4
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 1058812
                    local.set 0
                    loop  ;; label = @9
                      local.get 5
                      local.get 0
                      i32.load
                      local.tee 6
                      local.get 0
                      i32.load offset=4
                      local.tee 8
                      i32.add
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 0
                      i32.load offset=8
                      local.tee 0
                      br_if 0 (;@9;)
                      br 3 (;@6;)
                    end
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1058380
                      local.tee 0
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      local.get 0
                      i32.ge_u
                      br_if 1 (;@8;)
                    end
                    i32.const 0
                    local.get 5
                    i32.store offset=1058380
                  end
                  i32.const 0
                  local.set 0
                  i32.const 0
                  local.get 2
                  i32.store offset=1058816
                  i32.const 0
                  local.get 5
                  i32.store offset=1058812
                  i32.const 0
                  i32.const -1
                  i32.store offset=1058396
                  i32.const 0
                  i32.const 0
                  i32.load offset=1058836
                  i32.store offset=1058400
                  i32.const 0
                  i32.const 0
                  i32.store offset=1058824
                  loop  ;; label = @8
                    local.get 0
                    i32.const 1058412
                    i32.add
                    local.get 0
                    i32.const 1058404
                    i32.add
                    local.tee 4
                    i32.store
                    local.get 0
                    i32.const 1058416
                    i32.add
                    local.get 4
                    i32.store
                    local.get 0
                    i32.const 8
                    i32.add
                    local.tee 0
                    i32.const 256
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  local.get 5
                  i32.const -8
                  local.get 5
                  i32.sub
                  i32.const 15
                  i32.and
                  i32.const 0
                  local.get 5
                  i32.const 8
                  i32.add
                  i32.const 15
                  i32.and
                  select
                  local.tee 0
                  i32.add
                  local.tee 4
                  local.get 2
                  i32.const -56
                  i32.add
                  local.tee 6
                  local.get 0
                  i32.sub
                  local.tee 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  i32.const 0
                  i32.const 0
                  i32.load offset=1058852
                  i32.store offset=1058392
                  i32.const 0
                  local.get 0
                  i32.store offset=1058376
                  i32.const 0
                  local.get 4
                  i32.store offset=1058388
                  local.get 5
                  local.get 6
                  i32.add
                  i32.const 56
                  i32.store offset=4
                  br 2 (;@5;)
                end
                local.get 0
                i32.load8_u offset=12
                i32.const 8
                i32.and
                br_if 0 (;@6;)
                local.get 5
                local.get 4
                i32.le_u
                br_if 0 (;@6;)
                local.get 6
                local.get 4
                i32.gt_u
                br_if 0 (;@6;)
                local.get 4
                i32.const -8
                local.get 4
                i32.sub
                i32.const 15
                i32.and
                i32.const 0
                local.get 4
                i32.const 8
                i32.add
                i32.const 15
                i32.and
                select
                local.tee 6
                i32.add
                local.tee 5
                i32.const 0
                i32.load offset=1058376
                local.get 2
                i32.add
                local.tee 11
                local.get 6
                i32.sub
                local.tee 6
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 0
                local.get 8
                local.get 2
                i32.add
                i32.store offset=4
                i32.const 0
                i32.const 0
                i32.load offset=1058852
                i32.store offset=1058392
                i32.const 0
                local.get 6
                i32.store offset=1058376
                i32.const 0
                local.get 5
                i32.store offset=1058388
                local.get 4
                local.get 11
                i32.add
                i32.const 56
                i32.store offset=4
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 5
                i32.const 0
                i32.load offset=1058380
                local.tee 8
                i32.ge_u
                br_if 0 (;@6;)
                i32.const 0
                local.get 5
                i32.store offset=1058380
                local.get 5
                local.set 8
              end
              local.get 5
              local.get 2
              i32.add
              local.set 6
              i32.const 1058812
              local.set 0
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            loop  ;; label = @13
                              local.get 0
                              i32.load
                              local.get 6
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 0
                              i32.load offset=8
                              local.tee 0
                              br_if 0 (;@13;)
                              br 2 (;@11;)
                            end
                          end
                          local.get 0
                          i32.load8_u offset=12
                          i32.const 8
                          i32.and
                          i32.eqz
                          br_if 1 (;@10;)
                        end
                        i32.const 1058812
                        local.set 0
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load
                            local.tee 6
                            local.get 4
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 6
                            local.get 0
                            i32.load offset=4
                            i32.add
                            local.tee 6
                            local.get 4
                            i32.gt_u
                            br_if 3 (;@9;)
                          end
                          local.get 0
                          i32.load offset=8
                          local.set 0
                          br 0 (;@11;)
                        end
                      end
                      local.get 0
                      local.get 5
                      i32.store
                      local.get 0
                      local.get 0
                      i32.load offset=4
                      local.get 2
                      i32.add
                      i32.store offset=4
                      local.get 5
                      i32.const -8
                      local.get 5
                      i32.sub
                      i32.const 15
                      i32.and
                      i32.const 0
                      local.get 5
                      i32.const 8
                      i32.add
                      i32.const 15
                      i32.and
                      select
                      i32.add
                      local.tee 11
                      local.get 3
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 6
                      i32.const -8
                      local.get 6
                      i32.sub
                      i32.const 15
                      i32.and
                      i32.const 0
                      local.get 6
                      i32.const 8
                      i32.add
                      i32.const 15
                      i32.and
                      select
                      i32.add
                      local.tee 5
                      local.get 11
                      i32.sub
                      local.get 3
                      i32.sub
                      local.set 0
                      local.get 11
                      local.get 3
                      i32.add
                      local.set 6
                      block  ;; label = @10
                        local.get 4
                        local.get 5
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 6
                        i32.store offset=1058388
                        i32.const 0
                        i32.const 0
                        i32.load offset=1058376
                        local.get 0
                        i32.add
                        local.tee 0
                        i32.store offset=1058376
                        local.get 6
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br 3 (;@7;)
                      end
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1058384
                        local.get 5
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 6
                        i32.store offset=1058384
                        i32.const 0
                        i32.const 0
                        i32.load offset=1058372
                        local.get 0
                        i32.add
                        local.tee 0
                        i32.store offset=1058372
                        local.get 6
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 6
                        local.get 0
                        i32.add
                        local.get 0
                        i32.store
                        br 3 (;@7;)
                      end
                      block  ;; label = @10
                        local.get 5
                        i32.load offset=4
                        local.tee 4
                        i32.const 3
                        i32.and
                        i32.const 1
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 4
                        i32.const -8
                        i32.and
                        local.set 7
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 4
                            i32.const 255
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 5
                            i32.load offset=12
                            local.set 3
                            block  ;; label = @13
                              local.get 5
                              i32.load offset=8
                              local.tee 2
                              local.get 4
                              i32.const 3
                              i32.shr_u
                              local.tee 9
                              i32.const 3
                              i32.shl
                              i32.const 1058404
                              i32.add
                              local.tee 4
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 8
                              local.get 2
                              i32.gt_u
                              drop
                            end
                            block  ;; label = @13
                              local.get 3
                              local.get 2
                              i32.ne
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.const 0
                              i32.load offset=1058364
                              i32.const -2
                              local.get 9
                              i32.rotl
                              i32.and
                              i32.store offset=1058364
                              br 2 (;@11;)
                            end
                            block  ;; label = @13
                              local.get 3
                              local.get 4
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 8
                              local.get 3
                              i32.gt_u
                              drop
                            end
                            local.get 3
                            local.get 2
                            i32.store offset=8
                            local.get 2
                            local.get 3
                            i32.store offset=12
                            br 1 (;@11;)
                          end
                          local.get 5
                          i32.load offset=24
                          local.set 9
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 5
                              i32.load offset=12
                              local.tee 2
                              local.get 5
                              i32.eq
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                local.get 8
                                local.get 5
                                i32.load offset=8
                                local.tee 4
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 4
                                i32.load offset=12
                                local.get 5
                                i32.ne
                                drop
                              end
                              local.get 2
                              local.get 4
                              i32.store offset=8
                              local.get 4
                              local.get 2
                              i32.store offset=12
                              br 1 (;@12;)
                            end
                            block  ;; label = @13
                              local.get 5
                              i32.const 20
                              i32.add
                              local.tee 4
                              i32.load
                              local.tee 3
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 16
                              i32.add
                              local.tee 4
                              i32.load
                              local.tee 3
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 2
                              br 1 (;@12;)
                            end
                            loop  ;; label = @13
                              local.get 4
                              local.set 8
                              local.get 3
                              local.tee 2
                              i32.const 20
                              i32.add
                              local.tee 4
                              i32.load
                              local.tee 3
                              br_if 0 (;@13;)
                              local.get 2
                              i32.const 16
                              i32.add
                              local.set 4
                              local.get 2
                              i32.load offset=16
                              local.tee 3
                              br_if 0 (;@13;)
                            end
                            local.get 8
                            i32.const 0
                            i32.store
                          end
                          local.get 9
                          i32.eqz
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 5
                              i32.load offset=28
                              local.tee 3
                              i32.const 2
                              i32.shl
                              i32.const 1058668
                              i32.add
                              local.tee 4
                              i32.load
                              local.get 5
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 4
                              local.get 2
                              i32.store
                              local.get 2
                              br_if 1 (;@12;)
                              i32.const 0
                              i32.const 0
                              i32.load offset=1058368
                              i32.const -2
                              local.get 3
                              i32.rotl
                              i32.and
                              i32.store offset=1058368
                              br 2 (;@11;)
                            end
                            local.get 9
                            i32.const 16
                            i32.const 20
                            local.get 9
                            i32.load offset=16
                            local.get 5
                            i32.eq
                            select
                            i32.add
                            local.get 2
                            i32.store
                            local.get 2
                            i32.eqz
                            br_if 1 (;@11;)
                          end
                          local.get 2
                          local.get 9
                          i32.store offset=24
                          block  ;; label = @12
                            local.get 5
                            i32.load offset=16
                            local.tee 4
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 2
                            local.get 4
                            i32.store offset=16
                            local.get 4
                            local.get 2
                            i32.store offset=24
                          end
                          local.get 5
                          i32.load offset=20
                          local.tee 4
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 2
                          i32.const 20
                          i32.add
                          local.get 4
                          i32.store
                          local.get 4
                          local.get 2
                          i32.store offset=24
                        end
                        local.get 7
                        local.get 0
                        i32.add
                        local.set 0
                        local.get 5
                        local.get 7
                        i32.add
                        local.set 5
                      end
                      local.get 5
                      local.get 5
                      i32.load offset=4
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get 6
                      local.get 0
                      i32.add
                      local.get 0
                      i32.store
                      local.get 6
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      block  ;; label = @10
                        local.get 0
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 3
                        i32.shr_u
                        local.tee 4
                        i32.const 3
                        i32.shl
                        i32.const 1058404
                        i32.add
                        local.set 0
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1058364
                            local.tee 3
                            i32.const 1
                            local.get 4
                            i32.shl
                            local.tee 4
                            i32.and
                            br_if 0 (;@12;)
                            i32.const 0
                            local.get 3
                            local.get 4
                            i32.or
                            i32.store offset=1058364
                            local.get 0
                            local.set 4
                            br 1 (;@11;)
                          end
                          local.get 0
                          i32.load offset=8
                          local.set 4
                        end
                        local.get 4
                        local.get 6
                        i32.store offset=12
                        local.get 0
                        local.get 6
                        i32.store offset=8
                        local.get 6
                        local.get 0
                        i32.store offset=12
                        local.get 6
                        local.get 4
                        i32.store offset=8
                        br 3 (;@7;)
                      end
                      i32.const 0
                      local.set 4
                      block  ;; label = @10
                        local.get 0
                        i32.const 8
                        i32.shr_u
                        local.tee 3
                        i32.eqz
                        br_if 0 (;@10;)
                        i32.const 31
                        local.set 4
                        local.get 0
                        i32.const 16777215
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 3
                        local.get 3
                        i32.const 1048320
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 8
                        i32.and
                        local.tee 4
                        i32.shl
                        local.tee 3
                        local.get 3
                        i32.const 520192
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 4
                        i32.and
                        local.tee 3
                        i32.shl
                        local.tee 5
                        local.get 5
                        i32.const 245760
                        i32.add
                        i32.const 16
                        i32.shr_u
                        i32.const 2
                        i32.and
                        local.tee 5
                        i32.shl
                        i32.const 15
                        i32.shr_u
                        local.get 3
                        local.get 4
                        i32.or
                        local.get 5
                        i32.or
                        i32.sub
                        local.tee 4
                        i32.const 1
                        i32.shl
                        local.get 0
                        local.get 4
                        i32.const 21
                        i32.add
                        i32.shr_u
                        i32.const 1
                        i32.and
                        i32.or
                        i32.const 28
                        i32.add
                        local.set 4
                      end
                      local.get 6
                      local.get 4
                      i32.store offset=28
                      local.get 6
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 4
                      i32.const 2
                      i32.shl
                      i32.const 1058668
                      i32.add
                      local.set 3
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1058368
                        local.tee 5
                        i32.const 1
                        local.get 4
                        i32.shl
                        local.tee 8
                        i32.and
                        br_if 0 (;@10;)
                        local.get 3
                        local.get 6
                        i32.store
                        i32.const 0
                        local.get 5
                        local.get 8
                        i32.or
                        i32.store offset=1058368
                        local.get 6
                        local.get 3
                        i32.store offset=24
                        local.get 6
                        local.get 6
                        i32.store offset=8
                        local.get 6
                        local.get 6
                        i32.store offset=12
                        br 3 (;@7;)
                      end
                      local.get 0
                      i32.const 0
                      i32.const 25
                      local.get 4
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 4
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 4
                      local.get 3
                      i32.load
                      local.set 5
                      loop  ;; label = @10
                        local.get 5
                        local.tee 3
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 0
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 4
                        i32.const 29
                        i32.shr_u
                        local.set 5
                        local.get 4
                        i32.const 1
                        i32.shl
                        local.set 4
                        local.get 3
                        local.get 5
                        i32.const 4
                        i32.and
                        i32.add
                        i32.const 16
                        i32.add
                        local.tee 8
                        i32.load
                        local.tee 5
                        br_if 0 (;@10;)
                      end
                      local.get 8
                      local.get 6
                      i32.store
                      local.get 6
                      local.get 3
                      i32.store offset=24
                      local.get 6
                      local.get 6
                      i32.store offset=12
                      local.get 6
                      local.get 6
                      i32.store offset=8
                      br 2 (;@7;)
                    end
                    local.get 5
                    i32.const -8
                    local.get 5
                    i32.sub
                    i32.const 15
                    i32.and
                    i32.const 0
                    local.get 5
                    i32.const 8
                    i32.add
                    i32.const 15
                    i32.and
                    select
                    local.tee 0
                    i32.add
                    local.tee 11
                    local.get 2
                    i32.const -56
                    i32.add
                    local.tee 8
                    local.get 0
                    i32.sub
                    local.tee 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 5
                    local.get 8
                    i32.add
                    i32.const 56
                    i32.store offset=4
                    local.get 4
                    local.get 6
                    i32.const 55
                    local.get 6
                    i32.sub
                    i32.const 15
                    i32.and
                    i32.const 0
                    local.get 6
                    i32.const -55
                    i32.add
                    i32.const 15
                    i32.and
                    select
                    i32.add
                    i32.const -63
                    i32.add
                    local.tee 8
                    local.get 8
                    local.get 4
                    i32.const 16
                    i32.add
                    i32.lt_u
                    select
                    local.tee 8
                    i32.const 35
                    i32.store offset=4
                    i32.const 0
                    i32.const 0
                    i32.load offset=1058852
                    i32.store offset=1058392
                    i32.const 0
                    local.get 0
                    i32.store offset=1058376
                    i32.const 0
                    local.get 11
                    i32.store offset=1058388
                    local.get 8
                    i32.const 16
                    i32.add
                    i32.const 0
                    i64.load offset=1058820 align=4
                    i64.store align=4
                    local.get 8
                    i32.const 0
                    i64.load offset=1058812 align=4
                    i64.store offset=8 align=4
                    i32.const 0
                    local.get 8
                    i32.const 8
                    i32.add
                    i32.store offset=1058820
                    i32.const 0
                    local.get 2
                    i32.store offset=1058816
                    i32.const 0
                    local.get 5
                    i32.store offset=1058812
                    i32.const 0
                    i32.const 0
                    i32.store offset=1058824
                    local.get 8
                    i32.const 36
                    i32.add
                    local.set 0
                    loop  ;; label = @9
                      local.get 0
                      i32.const 7
                      i32.store
                      local.get 0
                      i32.const 4
                      i32.add
                      local.tee 0
                      local.get 6
                      i32.lt_u
                      br_if 0 (;@9;)
                    end
                    local.get 8
                    local.get 4
                    i32.eq
                    br_if 3 (;@5;)
                    local.get 8
                    local.get 8
                    i32.load offset=4
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 8
                    local.get 8
                    local.get 4
                    i32.sub
                    local.tee 2
                    i32.store
                    local.get 4
                    local.get 2
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    block  ;; label = @9
                      local.get 2
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 2
                      i32.const 3
                      i32.shr_u
                      local.tee 6
                      i32.const 3
                      i32.shl
                      i32.const 1058404
                      i32.add
                      local.set 0
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1058364
                          local.tee 5
                          i32.const 1
                          local.get 6
                          i32.shl
                          local.tee 6
                          i32.and
                          br_if 0 (;@11;)
                          i32.const 0
                          local.get 5
                          local.get 6
                          i32.or
                          i32.store offset=1058364
                          local.get 0
                          local.set 6
                          br 1 (;@10;)
                        end
                        local.get 0
                        i32.load offset=8
                        local.set 6
                      end
                      local.get 6
                      local.get 4
                      i32.store offset=12
                      local.get 0
                      local.get 4
                      i32.store offset=8
                      local.get 4
                      local.get 0
                      i32.store offset=12
                      local.get 4
                      local.get 6
                      i32.store offset=8
                      br 4 (;@5;)
                    end
                    i32.const 0
                    local.set 0
                    block  ;; label = @9
                      local.get 2
                      i32.const 8
                      i32.shr_u
                      local.tee 6
                      i32.eqz
                      br_if 0 (;@9;)
                      i32.const 31
                      local.set 0
                      local.get 2
                      i32.const 16777215
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 6
                      local.get 6
                      i32.const 1048320
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 8
                      i32.and
                      local.tee 0
                      i32.shl
                      local.tee 6
                      local.get 6
                      i32.const 520192
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 4
                      i32.and
                      local.tee 6
                      i32.shl
                      local.tee 5
                      local.get 5
                      i32.const 245760
                      i32.add
                      i32.const 16
                      i32.shr_u
                      i32.const 2
                      i32.and
                      local.tee 5
                      i32.shl
                      i32.const 15
                      i32.shr_u
                      local.get 6
                      local.get 0
                      i32.or
                      local.get 5
                      i32.or
                      i32.sub
                      local.tee 0
                      i32.const 1
                      i32.shl
                      local.get 2
                      local.get 0
                      i32.const 21
                      i32.add
                      i32.shr_u
                      i32.const 1
                      i32.and
                      i32.or
                      i32.const 28
                      i32.add
                      local.set 0
                    end
                    local.get 4
                    i64.const 0
                    i64.store offset=16 align=4
                    local.get 4
                    i32.const 28
                    i32.add
                    local.get 0
                    i32.store
                    local.get 0
                    i32.const 2
                    i32.shl
                    i32.const 1058668
                    i32.add
                    local.set 6
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1058368
                      local.tee 5
                      i32.const 1
                      local.get 0
                      i32.shl
                      local.tee 8
                      i32.and
                      br_if 0 (;@9;)
                      local.get 6
                      local.get 4
                      i32.store
                      i32.const 0
                      local.get 5
                      local.get 8
                      i32.or
                      i32.store offset=1058368
                      local.get 4
                      i32.const 24
                      i32.add
                      local.get 6
                      i32.store
                      local.get 4
                      local.get 4
                      i32.store offset=8
                      local.get 4
                      local.get 4
                      i32.store offset=12
                      br 4 (;@5;)
                    end
                    local.get 2
                    i32.const 0
                    i32.const 25
                    local.get 0
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get 0
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set 0
                    local.get 6
                    i32.load
                    local.set 5
                    loop  ;; label = @9
                      local.get 5
                      local.tee 6
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.get 2
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 0
                      i32.const 29
                      i32.shr_u
                      local.set 5
                      local.get 0
                      i32.const 1
                      i32.shl
                      local.set 0
                      local.get 6
                      local.get 5
                      i32.const 4
                      i32.and
                      i32.add
                      i32.const 16
                      i32.add
                      local.tee 8
                      i32.load
                      local.tee 5
                      br_if 0 (;@9;)
                    end
                    local.get 8
                    local.get 4
                    i32.store
                    local.get 4
                    i32.const 24
                    i32.add
                    local.get 6
                    i32.store
                    local.get 4
                    local.get 4
                    i32.store offset=12
                    local.get 4
                    local.get 4
                    i32.store offset=8
                    br 3 (;@5;)
                  end
                  local.get 3
                  i32.load offset=8
                  local.set 0
                  local.get 3
                  local.get 6
                  i32.store offset=8
                  local.get 0
                  local.get 6
                  i32.store offset=12
                  local.get 6
                  i32.const 0
                  i32.store offset=24
                  local.get 6
                  local.get 0
                  i32.store offset=8
                  local.get 6
                  local.get 3
                  i32.store offset=12
                end
                local.get 11
                i32.const 8
                i32.add
                local.set 0
                br 5 (;@1;)
              end
              local.get 6
              i32.load offset=8
              local.set 0
              local.get 6
              local.get 4
              i32.store offset=8
              local.get 0
              local.get 4
              i32.store offset=12
              local.get 4
              i32.const 24
              i32.add
              i32.const 0
              i32.store
              local.get 4
              local.get 0
              i32.store offset=8
              local.get 4
              local.get 6
              i32.store offset=12
            end
            i32.const 0
            i32.load offset=1058376
            local.tee 0
            local.get 3
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1058388
            local.tee 4
            local.get 3
            i32.add
            local.tee 6
            local.get 0
            local.get 3
            i32.sub
            local.tee 0
            i32.const 1
            i32.or
            i32.store offset=4
            i32.const 0
            local.get 0
            i32.store offset=1058376
            i32.const 0
            local.get 6
            i32.store offset=1058388
            local.get 4
            local.get 3
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 4
            i32.const 8
            i32.add
            local.set 0
            br 3 (;@1;)
          end
          i32.const 0
          local.set 0
          i32.const 0
          i32.const 48
          i32.store offset=1058860
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 11
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 8
              local.get 8
              i32.load offset=28
              local.tee 4
              i32.const 2
              i32.shl
              i32.const 1058668
              i32.add
              local.tee 0
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 0
              local.get 5
              i32.store
              local.get 5
              br_if 1 (;@4;)
              i32.const 0
              local.get 7
              i32.const -2
              local.get 4
              i32.rotl
              i32.and
              local.tee 7
              i32.store offset=1058368
              br 2 (;@3;)
            end
            local.get 11
            i32.const 16
            i32.const 20
            local.get 11
            i32.load offset=16
            local.get 8
            i32.eq
            select
            i32.add
            local.get 5
            i32.store
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 5
          local.get 11
          i32.store offset=24
          block  ;; label = @4
            local.get 8
            i32.load offset=16
            local.tee 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            local.get 0
            i32.store offset=16
            local.get 0
            local.get 5
            i32.store offset=24
          end
          local.get 8
          i32.const 20
          i32.add
          i32.load
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          i32.const 20
          i32.add
          local.get 0
          i32.store
          local.get 0
          local.get 5
          i32.store offset=24
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
            local.get 8
            local.get 6
            local.get 3
            i32.add
            local.tee 0
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 8
            local.get 0
            i32.add
            local.tee 0
            local.get 0
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 8
          local.get 3
          i32.add
          local.tee 5
          local.get 6
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 8
          local.get 3
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 5
          local.get 6
          i32.add
          local.get 6
          i32.store
          block  ;; label = @4
            local.get 6
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 6
            i32.const 3
            i32.shr_u
            local.tee 4
            i32.const 3
            i32.shl
            i32.const 1058404
            i32.add
            local.set 0
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=1058364
                local.tee 6
                i32.const 1
                local.get 4
                i32.shl
                local.tee 4
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 6
                local.get 4
                i32.or
                i32.store offset=1058364
                local.get 0
                local.set 4
                br 1 (;@5;)
              end
              local.get 0
              i32.load offset=8
              local.set 4
            end
            local.get 4
            local.get 5
            i32.store offset=12
            local.get 0
            local.get 5
            i32.store offset=8
            local.get 5
            local.get 0
            i32.store offset=12
            local.get 5
            local.get 4
            i32.store offset=8
            br 1 (;@3;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 6
              i32.const 8
              i32.shr_u
              local.tee 4
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              br 1 (;@4;)
            end
            i32.const 31
            local.set 0
            local.get 6
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@4;)
            local.get 4
            local.get 4
            i32.const 1048320
            i32.add
            i32.const 16
            i32.shr_u
            i32.const 8
            i32.and
            local.tee 0
            i32.shl
            local.tee 4
            local.get 4
            i32.const 520192
            i32.add
            i32.const 16
            i32.shr_u
            i32.const 4
            i32.and
            local.tee 4
            i32.shl
            local.tee 3
            local.get 3
            i32.const 245760
            i32.add
            i32.const 16
            i32.shr_u
            i32.const 2
            i32.and
            local.tee 3
            i32.shl
            i32.const 15
            i32.shr_u
            local.get 4
            local.get 0
            i32.or
            local.get 3
            i32.or
            i32.sub
            local.tee 0
            i32.const 1
            i32.shl
            local.get 6
            local.get 0
            i32.const 21
            i32.add
            i32.shr_u
            i32.const 1
            i32.and
            i32.or
            i32.const 28
            i32.add
            local.set 0
          end
          local.get 5
          local.get 0
          i32.store offset=28
          local.get 5
          i64.const 0
          i64.store offset=16 align=4
          local.get 0
          i32.const 2
          i32.shl
          i32.const 1058668
          i32.add
          local.set 4
          block  ;; label = @4
            local.get 7
            i32.const 1
            local.get 0
            i32.shl
            local.tee 3
            i32.and
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            i32.store
            i32.const 0
            local.get 7
            local.get 3
            i32.or
            i32.store offset=1058368
            local.get 5
            local.get 4
            i32.store offset=24
            local.get 5
            local.get 5
            i32.store offset=8
            local.get 5
            local.get 5
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 6
          i32.const 0
          i32.const 25
          local.get 0
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 0
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 0
          local.get 4
          i32.load
          local.set 3
          block  ;; label = @4
            loop  ;; label = @5
              local.get 3
              local.tee 4
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 6
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              i32.const 29
              i32.shr_u
              local.set 3
              local.get 0
              i32.const 1
              i32.shl
              local.set 0
              local.get 4
              local.get 3
              i32.const 4
              i32.and
              i32.add
              i32.const 16
              i32.add
              local.tee 2
              i32.load
              local.tee 3
              br_if 0 (;@5;)
            end
            local.get 2
            local.get 5
            i32.store
            local.get 5
            local.get 4
            i32.store offset=24
            local.get 5
            local.get 5
            i32.store offset=12
            local.get 5
            local.get 5
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 4
          i32.load offset=8
          local.set 0
          local.get 4
          local.get 5
          i32.store offset=8
          local.get 0
          local.get 5
          i32.store offset=12
          local.get 5
          i32.const 0
          i32.store offset=24
          local.get 5
          local.get 0
          i32.store offset=8
          local.get 5
          local.get 4
          i32.store offset=12
        end
        local.get 8
        i32.const 8
        i32.add
        local.set 0
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 10
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 5
            local.get 5
            i32.load offset=28
            local.tee 6
            i32.const 2
            i32.shl
            i32.const 1058668
            i32.add
            local.tee 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 8
            i32.store
            local.get 8
            br_if 1 (;@3;)
            i32.const 0
            local.get 9
            i32.const -2
            local.get 6
            i32.rotl
            i32.and
            i32.store offset=1058368
            br 2 (;@2;)
          end
          local.get 10
          i32.const 16
          i32.const 20
          local.get 10
          i32.load offset=16
          local.get 5
          i32.eq
          select
          i32.add
          local.get 8
          i32.store
          local.get 8
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 8
        local.get 10
        i32.store offset=24
        block  ;; label = @3
          local.get 5
          i32.load offset=16
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          local.get 0
          i32.store offset=16
          local.get 0
          local.get 8
          i32.store offset=24
        end
        local.get 5
        i32.const 20
        i32.add
        i32.load
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 8
        i32.const 20
        i32.add
        local.get 0
        i32.store
        local.get 0
        local.get 8
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 5
          local.get 4
          local.get 3
          i32.add
          local.tee 0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 5
          local.get 0
          i32.add
          local.tee 0
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 5
        local.get 3
        i32.add
        local.tee 6
        local.get 4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 5
        local.get 3
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 6
        local.get 4
        i32.add
        local.get 4
        i32.store
        block  ;; label = @3
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 7
          i32.const 3
          i32.shr_u
          local.tee 8
          i32.const 3
          i32.shl
          i32.const 1058404
          i32.add
          local.set 3
          i32.const 0
          i32.load offset=1058384
          local.set 0
          block  ;; label = @4
            block  ;; label = @5
              i32.const 1
              local.get 8
              i32.shl
              local.tee 8
              local.get 2
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 8
              local.get 2
              i32.or
              i32.store offset=1058364
              local.get 3
              local.set 8
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=8
            local.set 8
          end
          local.get 8
          local.get 0
          i32.store offset=12
          local.get 3
          local.get 0
          i32.store offset=8
          local.get 0
          local.get 3
          i32.store offset=12
          local.get 0
          local.get 8
          i32.store offset=8
        end
        i32.const 0
        local.get 6
        i32.store offset=1058384
        i32.const 0
        local.get 4
        i32.store offset=1058372
      end
      local.get 5
      i32.const 8
      i32.add
      local.set 0
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func $free (type 1) (param i32)
    local.get 0
    call $dlfree)
  (func $dlfree (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -8
      i32.add
      local.tee 1
      local.get 0
      i32.const -4
      i32.add
      i32.load
      local.tee 2
      i32.const -8
      i32.and
      local.tee 0
      i32.add
      local.set 3
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 1
        i32.load
        local.tee 2
        i32.sub
        local.tee 1
        i32.const 0
        i32.load offset=1058380
        local.tee 4
        i32.lt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i32.add
        local.set 0
        block  ;; label = @3
          i32.const 0
          i32.load offset=1058384
          local.get 1
          i32.eq
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 2
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=12
            local.set 5
            block  ;; label = @5
              local.get 1
              i32.load offset=8
              local.tee 6
              local.get 2
              i32.const 3
              i32.shr_u
              local.tee 7
              i32.const 3
              i32.shl
              i32.const 1058404
              i32.add
              local.tee 2
              i32.eq
              br_if 0 (;@5;)
              local.get 4
              local.get 6
              i32.gt_u
              drop
            end
            block  ;; label = @5
              local.get 5
              local.get 6
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=1058364
              i32.const -2
              local.get 7
              i32.rotl
              i32.and
              i32.store offset=1058364
              br 3 (;@2;)
            end
            block  ;; label = @5
              local.get 5
              local.get 2
              i32.eq
              br_if 0 (;@5;)
              local.get 4
              local.get 5
              i32.gt_u
              drop
            end
            local.get 5
            local.get 6
            i32.store offset=8
            local.get 6
            local.get 5
            i32.store offset=12
            br 2 (;@2;)
          end
          local.get 1
          i32.load offset=24
          local.set 7
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load offset=12
              local.tee 5
              local.get 1
              i32.eq
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 4
                local.get 1
                i32.load offset=8
                local.tee 2
                i32.gt_u
                br_if 0 (;@6;)
                local.get 2
                i32.load offset=12
                local.get 1
                i32.ne
                drop
              end
              local.get 5
              local.get 2
              i32.store offset=8
              local.get 2
              local.get 5
              i32.store offset=12
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 1
              i32.const 20
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              local.get 1
              i32.const 16
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              i32.const 0
              local.set 5
              br 1 (;@4;)
            end
            loop  ;; label = @5
              local.get 2
              local.set 6
              local.get 4
              local.tee 5
              i32.const 20
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              local.get 5
              i32.const 16
              i32.add
              local.set 2
              local.get 5
              i32.load offset=16
              local.tee 4
              br_if 0 (;@5;)
            end
            local.get 6
            i32.const 0
            i32.store
          end
          local.get 7
          i32.eqz
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load offset=28
              local.tee 4
              i32.const 2
              i32.shl
              i32.const 1058668
              i32.add
              local.tee 2
              i32.load
              local.get 1
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              local.get 5
              i32.store
              local.get 5
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=1058368
              i32.const -2
              local.get 4
              i32.rotl
              i32.and
              i32.store offset=1058368
              br 3 (;@2;)
            end
            local.get 7
            i32.const 16
            i32.const 20
            local.get 7
            i32.load offset=16
            local.get 1
            i32.eq
            select
            i32.add
            local.get 5
            i32.store
            local.get 5
            i32.eqz
            br_if 2 (;@2;)
          end
          local.get 5
          local.get 7
          i32.store offset=24
          block  ;; label = @4
            local.get 1
            i32.load offset=16
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            local.get 2
            i32.store offset=16
            local.get 2
            local.get 5
            i32.store offset=24
          end
          local.get 1
          i32.load offset=20
          local.tee 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 5
          i32.const 20
          i32.add
          local.get 2
          i32.store
          local.get 2
          local.get 5
          i32.store offset=24
          br 1 (;@2;)
        end
        local.get 3
        i32.load offset=4
        local.tee 2
        i32.const 3
        i32.and
        i32.const 3
        i32.ne
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.const -2
        i32.and
        i32.store offset=4
        i32.const 0
        local.get 0
        i32.store offset=1058372
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
        return
      end
      local.get 3
      local.get 1
      i32.le_u
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=4
      local.tee 2
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 2
          i32.and
          br_if 0 (;@3;)
          block  ;; label = @4
            i32.const 0
            i32.load offset=1058388
            local.get 3
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.store offset=1058388
            i32.const 0
            i32.const 0
            i32.load offset=1058376
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=1058376
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            i32.const 0
            i32.load offset=1058384
            i32.ne
            br_if 3 (;@1;)
            i32.const 0
            i32.const 0
            i32.store offset=1058372
            i32.const 0
            i32.const 0
            i32.store offset=1058384
            return
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1058384
            local.get 3
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.store offset=1058384
            i32.const 0
            i32.const 0
            i32.load offset=1058372
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=1058372
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 0
            i32.add
            local.get 0
            i32.store
            return
          end
          local.get 2
          i32.const -8
          i32.and
          local.get 0
          i32.add
          local.set 0
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 3
              i32.load offset=12
              local.set 4
              block  ;; label = @6
                local.get 3
                i32.load offset=8
                local.tee 5
                local.get 2
                i32.const 3
                i32.shr_u
                local.tee 3
                i32.const 3
                i32.shl
                i32.const 1058404
                i32.add
                local.tee 2
                i32.eq
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1058380
                local.get 5
                i32.gt_u
                drop
              end
              block  ;; label = @6
                local.get 4
                local.get 5
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 0
                i32.load offset=1058364
                i32.const -2
                local.get 3
                i32.rotl
                i32.and
                i32.store offset=1058364
                br 2 (;@4;)
              end
              block  ;; label = @6
                local.get 4
                local.get 2
                i32.eq
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1058380
                local.get 4
                i32.gt_u
                drop
              end
              local.get 4
              local.get 5
              i32.store offset=8
              local.get 5
              local.get 4
              i32.store offset=12
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=24
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=12
                local.tee 5
                local.get 3
                i32.eq
                br_if 0 (;@6;)
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1058380
                  local.get 3
                  i32.load offset=8
                  local.tee 2
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 2
                  i32.load offset=12
                  local.get 3
                  i32.ne
                  drop
                end
                local.get 5
                local.get 2
                i32.store offset=8
                local.get 2
                local.get 5
                i32.store offset=12
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 3
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 3
                i32.const 16
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 5
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 2
                local.set 6
                local.get 4
                local.tee 5
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 5
                i32.const 16
                i32.add
                local.set 2
                local.get 5
                i32.load offset=16
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 6
              i32.const 0
              i32.store
            end
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=28
                local.tee 4
                i32.const 2
                i32.shl
                i32.const 1058668
                i32.add
                local.tee 2
                i32.load
                local.get 3
                i32.ne
                br_if 0 (;@6;)
                local.get 2
                local.get 5
                i32.store
                local.get 5
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=1058368
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store offset=1058368
                br 2 (;@4;)
              end
              local.get 7
              i32.const 16
              i32.const 20
              local.get 7
              i32.load offset=16
              local.get 3
              i32.eq
              select
              i32.add
              local.get 5
              i32.store
              local.get 5
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 5
            local.get 7
            i32.store offset=24
            block  ;; label = @5
              local.get 3
              i32.load offset=16
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 5
              local.get 2
              i32.store offset=16
              local.get 2
              local.get 5
              i32.store offset=24
            end
            local.get 3
            i32.load offset=20
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            i32.const 20
            i32.add
            local.get 2
            i32.store
            local.get 2
            local.get 5
            i32.store offset=24
          end
          local.get 1
          local.get 0
          i32.add
          local.get 0
          i32.store
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          i32.const 0
          i32.load offset=1058384
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 0
          i32.store offset=1058372
          return
        end
        local.get 3
        local.get 2
        i32.const -2
        i32.and
        i32.store offset=4
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
      end
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.shr_u
        local.tee 2
        i32.const 3
        i32.shl
        i32.const 1058404
        i32.add
        local.set 0
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=1058364
            local.tee 4
            i32.const 1
            local.get 2
            i32.shl
            local.tee 2
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 2
            i32.or
            i32.store offset=1058364
            local.get 0
            local.set 2
            br 1 (;@3;)
          end
          local.get 0
          i32.load offset=8
          local.set 2
        end
        local.get 2
        local.get 1
        i32.store offset=12
        local.get 0
        local.get 1
        i32.store offset=8
        local.get 1
        local.get 0
        i32.store offset=12
        local.get 1
        local.get 2
        i32.store offset=8
        return
      end
      i32.const 0
      local.set 2
      block  ;; label = @2
        local.get 0
        i32.const 8
        i32.shr_u
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        i32.const 31
        local.set 2
        local.get 0
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 4
        local.get 4
        i32.const 1048320
        i32.add
        i32.const 16
        i32.shr_u
        i32.const 8
        i32.and
        local.tee 2
        i32.shl
        local.tee 4
        local.get 4
        i32.const 520192
        i32.add
        i32.const 16
        i32.shr_u
        i32.const 4
        i32.and
        local.tee 4
        i32.shl
        local.tee 5
        local.get 5
        i32.const 245760
        i32.add
        i32.const 16
        i32.shr_u
        i32.const 2
        i32.and
        local.tee 5
        i32.shl
        i32.const 15
        i32.shr_u
        local.get 4
        local.get 2
        i32.or
        local.get 5
        i32.or
        i32.sub
        local.tee 2
        i32.const 1
        i32.shl
        local.get 0
        local.get 2
        i32.const 21
        i32.add
        i32.shr_u
        i32.const 1
        i32.and
        i32.or
        i32.const 28
        i32.add
        local.set 2
      end
      local.get 1
      i64.const 0
      i64.store offset=16 align=4
      local.get 1
      i32.const 28
      i32.add
      local.get 2
      i32.store
      local.get 2
      i32.const 2
      i32.shl
      i32.const 1058668
      i32.add
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1058368
          local.tee 5
          i32.const 1
          local.get 2
          i32.shl
          local.tee 3
          i32.and
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i32.store
          i32.const 0
          local.get 5
          local.get 3
          i32.or
          i32.store offset=1058368
          local.get 1
          i32.const 24
          i32.add
          local.get 4
          i32.store
          local.get 1
          local.get 1
          i32.store offset=8
          local.get 1
          local.get 1
          i32.store offset=12
          br 1 (;@2;)
        end
        local.get 0
        i32.const 0
        i32.const 25
        local.get 2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get 2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set 2
        local.get 4
        i32.load
        local.set 5
        block  ;; label = @3
          loop  ;; label = @4
            local.get 5
            local.tee 4
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 0
            i32.eq
            br_if 1 (;@3;)
            local.get 2
            i32.const 29
            i32.shr_u
            local.set 5
            local.get 2
            i32.const 1
            i32.shl
            local.set 2
            local.get 4
            local.get 5
            i32.const 4
            i32.and
            i32.add
            i32.const 16
            i32.add
            local.tee 3
            i32.load
            local.tee 5
            br_if 0 (;@4;)
          end
          local.get 3
          local.get 1
          i32.store
          local.get 1
          local.get 1
          i32.store offset=12
          local.get 1
          i32.const 24
          i32.add
          local.get 4
          i32.store
          local.get 1
          local.get 1
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=8
        local.set 0
        local.get 4
        local.get 1
        i32.store offset=8
        local.get 0
        local.get 1
        i32.store offset=12
        local.get 1
        i32.const 24
        i32.add
        i32.const 0
        i32.store
        local.get 1
        local.get 0
        i32.store offset=8
        local.get 1
        local.get 4
        i32.store offset=12
      end
      i32.const 0
      i32.const 0
      i32.load offset=1058396
      i32.const -1
      i32.add
      local.tee 1
      i32.store offset=1058396
      local.get 1
      br_if 0 (;@1;)
      i32.const 1058820
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.load
        local.tee 0
        i32.const 8
        i32.add
        local.set 1
        local.get 0
        br_if 0 (;@2;)
      end
      i32.const 0
      i32.const -1
      i32.store offset=1058396
    end)
  (func $calloc (type 3) (param i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      local.get 0
      i32.mul
      local.set 2
      local.get 1
      local.get 0
      i32.or
      i32.const 65536
      i32.lt_u
      br_if 0 (;@1;)
      local.get 2
      i32.const -1
      local.get 2
      local.get 0
      i32.div_u
      local.get 1
      i32.eq
      select
      local.set 2
    end
    block  ;; label = @1
      local.get 2
      call $dlmalloc
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -4
      i32.add
      i32.load8_u
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 2
      call $memset
      drop
    end
    local.get 0)
  (func $realloc (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      local.get 1
      call $dlmalloc
      return
    end
    block  ;; label = @1
      local.get 1
      i32.const -64
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 48
      i32.store offset=1058860
      i32.const 0
      return
    end
    local.get 1
    i32.const 11
    i32.lt_u
    local.set 2
    local.get 1
    i32.const 19
    i32.add
    i32.const -16
    i32.and
    local.set 3
    local.get 0
    i32.const -8
    i32.add
    local.set 4
    local.get 0
    i32.const -4
    i32.add
    local.tee 5
    i32.load
    local.tee 6
    i32.const 3
    i32.and
    local.set 7
    i32.const 0
    i32.load offset=1058380
    local.set 8
    block  ;; label = @1
      local.get 6
      i32.const -8
      i32.and
      local.tee 9
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      local.get 7
      i32.const 1
      i32.eq
      br_if 0 (;@1;)
      local.get 8
      local.get 4
      i32.gt_u
      drop
    end
    i32.const 16
    local.get 3
    local.get 2
    select
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 7
          br_if 0 (;@3;)
          local.get 2
          i32.const 256
          i32.lt_u
          br_if 1 (;@2;)
          local.get 9
          local.get 2
          i32.const 4
          i32.or
          i32.lt_u
          br_if 1 (;@2;)
          local.get 9
          local.get 2
          i32.sub
          i32.const 0
          i32.load offset=1058844
          i32.const 1
          i32.shl
          i32.le_u
          br_if 2 (;@1;)
          br 1 (;@2;)
        end
        local.get 4
        local.get 9
        i32.add
        local.set 7
        block  ;; label = @3
          local.get 9
          local.get 2
          i32.lt_u
          br_if 0 (;@3;)
          local.get 9
          local.get 2
          i32.sub
          local.tee 1
          i32.const 16
          i32.lt_u
          br_if 2 (;@1;)
          local.get 5
          local.get 2
          local.get 6
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 4
          local.get 2
          i32.add
          local.tee 2
          local.get 1
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 7
          local.get 7
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 1
          call $dispose_chunk
          local.get 0
          return
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1058388
          local.get 7
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1058376
          local.get 9
          i32.add
          local.tee 9
          local.get 2
          i32.le_u
          br_if 1 (;@2;)
          local.get 5
          local.get 2
          local.get 6
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          i32.const 0
          local.get 4
          local.get 2
          i32.add
          local.tee 1
          i32.store offset=1058388
          i32.const 0
          local.get 9
          local.get 2
          i32.sub
          local.tee 2
          i32.store offset=1058376
          local.get 1
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          return
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1058384
          local.get 7
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1058372
          local.get 9
          i32.add
          local.tee 9
          local.get 2
          i32.lt_u
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 9
              local.get 2
              i32.sub
              local.tee 1
              i32.const 16
              i32.lt_u
              br_if 0 (;@5;)
              local.get 5
              local.get 2
              local.get 6
              i32.const 1
              i32.and
              i32.or
              i32.const 2
              i32.or
              i32.store
              local.get 4
              local.get 2
              i32.add
              local.tee 2
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 4
              local.get 9
              i32.add
              local.tee 9
              local.get 1
              i32.store
              local.get 9
              local.get 9
              i32.load offset=4
              i32.const -2
              i32.and
              i32.store offset=4
              br 1 (;@4;)
            end
            local.get 5
            local.get 6
            i32.const 1
            i32.and
            local.get 9
            i32.or
            i32.const 2
            i32.or
            i32.store
            local.get 4
            local.get 9
            i32.add
            local.tee 1
            local.get 1
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            i32.const 0
            local.set 1
            i32.const 0
            local.set 2
          end
          i32.const 0
          local.get 2
          i32.store offset=1058384
          i32.const 0
          local.get 1
          i32.store offset=1058372
          local.get 0
          return
        end
        local.get 7
        i32.load offset=4
        local.tee 3
        i32.const 2
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const -8
        i32.and
        local.get 9
        i32.add
        local.tee 10
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        local.get 10
        local.get 2
        i32.sub
        local.set 11
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 7
            i32.load offset=12
            local.set 1
            block  ;; label = @5
              local.get 7
              i32.load offset=8
              local.tee 9
              local.get 3
              i32.const 3
              i32.shr_u
              local.tee 3
              i32.const 3
              i32.shl
              i32.const 1058404
              i32.add
              local.tee 7
              i32.eq
              br_if 0 (;@5;)
              local.get 8
              local.get 9
              i32.gt_u
              drop
            end
            block  ;; label = @5
              local.get 1
              local.get 9
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=1058364
              i32.const -2
              local.get 3
              i32.rotl
              i32.and
              i32.store offset=1058364
              br 2 (;@3;)
            end
            block  ;; label = @5
              local.get 1
              local.get 7
              i32.eq
              br_if 0 (;@5;)
              local.get 8
              local.get 1
              i32.gt_u
              drop
            end
            local.get 1
            local.get 9
            i32.store offset=8
            local.get 9
            local.get 1
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 7
          i32.load offset=24
          local.set 12
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.load offset=12
              local.tee 3
              local.get 7
              i32.eq
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 8
                local.get 7
                i32.load offset=8
                local.tee 1
                i32.gt_u
                br_if 0 (;@6;)
                local.get 1
                i32.load offset=12
                local.get 7
                i32.ne
                drop
              end
              local.get 3
              local.get 1
              i32.store offset=8
              local.get 1
              local.get 3
              i32.store offset=12
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 7
              i32.const 20
              i32.add
              local.tee 1
              i32.load
              local.tee 9
              br_if 0 (;@5;)
              local.get 7
              i32.const 16
              i32.add
              local.tee 1
              i32.load
              local.tee 9
              br_if 0 (;@5;)
              i32.const 0
              local.set 3
              br 1 (;@4;)
            end
            loop  ;; label = @5
              local.get 1
              local.set 8
              local.get 9
              local.tee 3
              i32.const 20
              i32.add
              local.tee 1
              i32.load
              local.tee 9
              br_if 0 (;@5;)
              local.get 3
              i32.const 16
              i32.add
              local.set 1
              local.get 3
              i32.load offset=16
              local.tee 9
              br_if 0 (;@5;)
            end
            local.get 8
            i32.const 0
            i32.store
          end
          local.get 12
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.load offset=28
              local.tee 9
              i32.const 2
              i32.shl
              i32.const 1058668
              i32.add
              local.tee 1
              i32.load
              local.get 7
              i32.ne
              br_if 0 (;@5;)
              local.get 1
              local.get 3
              i32.store
              local.get 3
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=1058368
              i32.const -2
              local.get 9
              i32.rotl
              i32.and
              i32.store offset=1058368
              br 2 (;@3;)
            end
            local.get 12
            i32.const 16
            i32.const 20
            local.get 12
            i32.load offset=16
            local.get 7
            i32.eq
            select
            i32.add
            local.get 3
            i32.store
            local.get 3
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 3
          local.get 12
          i32.store offset=24
          block  ;; label = @4
            local.get 7
            i32.load offset=16
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 1
            i32.store offset=16
            local.get 1
            local.get 3
            i32.store offset=24
          end
          local.get 7
          i32.load offset=20
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 20
          i32.add
          local.get 1
          i32.store
          local.get 1
          local.get 3
          i32.store offset=24
        end
        block  ;; label = @3
          local.get 11
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 5
          local.get 6
          i32.const 1
          i32.and
          local.get 10
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 4
          local.get 10
          i32.add
          local.tee 1
          local.get 1
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          return
        end
        local.get 5
        local.get 2
        local.get 6
        i32.const 1
        i32.and
        i32.or
        i32.const 2
        i32.or
        i32.store
        local.get 4
        local.get 2
        i32.add
        local.tee 1
        local.get 11
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 4
        local.get 10
        i32.add
        local.tee 2
        local.get 2
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 11
        call $dispose_chunk
        local.get 0
        return
      end
      block  ;; label = @2
        local.get 1
        call $dlmalloc
        local.tee 2
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 2
      local.get 0
      local.get 5
      i32.load
      local.tee 9
      i32.const -8
      i32.and
      i32.const 4
      i32.const 8
      local.get 9
      i32.const 3
      i32.and
      select
      i32.sub
      local.tee 9
      local.get 1
      local.get 9
      local.get 1
      i32.lt_u
      select
      call $memcpy
      local.set 1
      local.get 0
      call $dlfree
      local.get 1
      local.set 0
    end
    local.get 0)
  (func $dispose_chunk (type 6) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.add
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.tee 3
        local.get 1
        i32.add
        local.set 1
        block  ;; label = @3
          i32.const 0
          i32.load offset=1058384
          local.get 0
          local.get 3
          i32.sub
          local.tee 0
          i32.eq
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1058380
          local.set 4
          block  ;; label = @4
            local.get 3
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=12
            local.set 5
            block  ;; label = @5
              local.get 0
              i32.load offset=8
              local.tee 6
              local.get 3
              i32.const 3
              i32.shr_u
              local.tee 7
              i32.const 3
              i32.shl
              i32.const 1058404
              i32.add
              local.tee 3
              i32.eq
              br_if 0 (;@5;)
              local.get 4
              local.get 6
              i32.gt_u
              drop
            end
            block  ;; label = @5
              local.get 5
              local.get 6
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=1058364
              i32.const -2
              local.get 7
              i32.rotl
              i32.and
              i32.store offset=1058364
              br 3 (;@2;)
            end
            block  ;; label = @5
              local.get 5
              local.get 3
              i32.eq
              br_if 0 (;@5;)
              local.get 4
              local.get 5
              i32.gt_u
              drop
            end
            local.get 5
            local.get 6
            i32.store offset=8
            local.get 6
            local.get 5
            i32.store offset=12
            br 2 (;@2;)
          end
          local.get 0
          i32.load offset=24
          local.set 7
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=12
              local.tee 6
              local.get 0
              i32.eq
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 4
                local.get 0
                i32.load offset=8
                local.tee 3
                i32.gt_u
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=12
                local.get 0
                i32.ne
                drop
              end
              local.get 6
              local.get 3
              i32.store offset=8
              local.get 3
              local.get 6
              i32.store offset=12
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 0
              i32.const 20
              i32.add
              local.tee 3
              i32.load
              local.tee 5
              br_if 0 (;@5;)
              local.get 0
              i32.const 16
              i32.add
              local.tee 3
              i32.load
              local.tee 5
              br_if 0 (;@5;)
              i32.const 0
              local.set 6
              br 1 (;@4;)
            end
            loop  ;; label = @5
              local.get 3
              local.set 4
              local.get 5
              local.tee 6
              i32.const 20
              i32.add
              local.tee 3
              i32.load
              local.tee 5
              br_if 0 (;@5;)
              local.get 6
              i32.const 16
              i32.add
              local.set 3
              local.get 6
              i32.load offset=16
              local.tee 5
              br_if 0 (;@5;)
            end
            local.get 4
            i32.const 0
            i32.store
          end
          local.get 7
          i32.eqz
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 1058668
              i32.add
              local.tee 3
              i32.load
              local.get 0
              i32.ne
              br_if 0 (;@5;)
              local.get 3
              local.get 6
              i32.store
              local.get 6
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=1058368
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=1058368
              br 3 (;@2;)
            end
            local.get 7
            i32.const 16
            i32.const 20
            local.get 7
            i32.load offset=16
            local.get 0
            i32.eq
            select
            i32.add
            local.get 6
            i32.store
            local.get 6
            i32.eqz
            br_if 2 (;@2;)
          end
          local.get 6
          local.get 7
          i32.store offset=24
          block  ;; label = @4
            local.get 0
            i32.load offset=16
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 3
            i32.store offset=16
            local.get 3
            local.get 6
            i32.store offset=24
          end
          local.get 0
          i32.load offset=20
          local.tee 3
          i32.eqz
          br_if 1 (;@2;)
          local.get 6
          i32.const 20
          i32.add
          local.get 3
          i32.store
          local.get 3
          local.get 6
          i32.store offset=24
          br 1 (;@2;)
        end
        local.get 2
        i32.load offset=4
        local.tee 3
        i32.const 3
        i32.and
        i32.const 3
        i32.ne
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.const -2
        i32.and
        i32.store offset=4
        i32.const 0
        local.get 1
        i32.store offset=1058372
        local.get 2
        local.get 1
        i32.store
        local.get 0
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.load offset=4
          local.tee 3
          i32.const 2
          i32.and
          br_if 0 (;@3;)
          block  ;; label = @4
            i32.const 0
            i32.load offset=1058388
            local.get 2
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 0
            i32.store offset=1058388
            i32.const 0
            i32.const 0
            i32.load offset=1058376
            local.get 1
            i32.add
            local.tee 1
            i32.store offset=1058376
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.load offset=1058384
            i32.ne
            br_if 3 (;@1;)
            i32.const 0
            i32.const 0
            i32.store offset=1058372
            i32.const 0
            i32.const 0
            i32.store offset=1058384
            return
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1058384
            local.get 2
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 0
            i32.store offset=1058384
            i32.const 0
            i32.const 0
            i32.load offset=1058372
            local.get 1
            i32.add
            local.tee 1
            i32.store offset=1058372
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 1
            i32.add
            local.get 1
            i32.store
            return
          end
          i32.const 0
          i32.load offset=1058380
          local.set 4
          local.get 3
          i32.const -8
          i32.and
          local.get 1
          i32.add
          local.set 1
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=12
              local.set 5
              block  ;; label = @6
                local.get 2
                i32.load offset=8
                local.tee 6
                local.get 3
                i32.const 3
                i32.shr_u
                local.tee 2
                i32.const 3
                i32.shl
                i32.const 1058404
                i32.add
                local.tee 3
                i32.eq
                br_if 0 (;@6;)
                local.get 4
                local.get 6
                i32.gt_u
                drop
              end
              block  ;; label = @6
                local.get 5
                local.get 6
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 0
                i32.load offset=1058364
                i32.const -2
                local.get 2
                i32.rotl
                i32.and
                i32.store offset=1058364
                br 2 (;@4;)
              end
              block  ;; label = @6
                local.get 5
                local.get 3
                i32.eq
                br_if 0 (;@6;)
                local.get 4
                local.get 5
                i32.gt_u
                drop
              end
              local.get 5
              local.get 6
              i32.store offset=8
              local.get 6
              local.get 5
              i32.store offset=12
              br 1 (;@4;)
            end
            local.get 2
            i32.load offset=24
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.load offset=12
                local.tee 6
                local.get 2
                i32.eq
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 4
                  local.get 2
                  i32.load offset=8
                  local.tee 3
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=12
                  local.get 2
                  i32.ne
                  drop
                end
                local.get 6
                local.get 3
                i32.store offset=8
                local.get 3
                local.get 6
                i32.store offset=12
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 2
                i32.const 20
                i32.add
                local.tee 3
                i32.load
                local.tee 5
                br_if 0 (;@6;)
                local.get 2
                i32.const 16
                i32.add
                local.tee 3
                i32.load
                local.tee 5
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 3
                local.set 4
                local.get 5
                local.tee 6
                i32.const 20
                i32.add
                local.tee 3
                i32.load
                local.tee 5
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 3
                local.get 6
                i32.load offset=16
                local.tee 5
                br_if 0 (;@6;)
              end
              local.get 4
              i32.const 0
              i32.store
            end
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.load offset=28
                local.tee 5
                i32.const 2
                i32.shl
                i32.const 1058668
                i32.add
                local.tee 3
                i32.load
                local.get 2
                i32.ne
                br_if 0 (;@6;)
                local.get 3
                local.get 6
                i32.store
                local.get 6
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=1058368
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=1058368
                br 2 (;@4;)
              end
              local.get 7
              i32.const 16
              i32.const 20
              local.get 7
              i32.load offset=16
              local.get 2
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 6
            local.get 7
            i32.store offset=24
            block  ;; label = @5
              local.get 2
              i32.load offset=16
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 3
              i32.store offset=16
              local.get 3
              local.get 6
              i32.store offset=24
            end
            local.get 2
            i32.load offset=20
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.const 20
            i32.add
            local.get 3
            i32.store
            local.get 3
            local.get 6
            i32.store offset=24
          end
          local.get 0
          local.get 1
          i32.add
          local.get 1
          i32.store
          local.get 0
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          i32.const 0
          i32.load offset=1058384
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 1
          i32.store offset=1058372
          return
        end
        local.get 2
        local.get 3
        i32.const -2
        i32.and
        i32.store offset=4
        local.get 0
        local.get 1
        i32.add
        local.get 1
        i32.store
        local.get 0
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
      end
      block  ;; label = @2
        local.get 1
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 3
        i32.shr_u
        local.tee 3
        i32.const 3
        i32.shl
        i32.const 1058404
        i32.add
        local.set 1
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=1058364
            local.tee 5
            i32.const 1
            local.get 3
            i32.shl
            local.tee 3
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 5
            local.get 3
            i32.or
            i32.store offset=1058364
            local.get 1
            local.set 3
            br 1 (;@3;)
          end
          local.get 1
          i32.load offset=8
          local.set 3
        end
        local.get 3
        local.get 0
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
        local.get 0
        local.get 1
        i32.store offset=12
        local.get 0
        local.get 3
        i32.store offset=8
        return
      end
      i32.const 0
      local.set 3
      block  ;; label = @2
        local.get 1
        i32.const 8
        i32.shr_u
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        i32.const 31
        local.set 3
        local.get 1
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 5
        local.get 5
        i32.const 1048320
        i32.add
        i32.const 16
        i32.shr_u
        i32.const 8
        i32.and
        local.tee 3
        i32.shl
        local.tee 5
        local.get 5
        i32.const 520192
        i32.add
        i32.const 16
        i32.shr_u
        i32.const 4
        i32.and
        local.tee 5
        i32.shl
        local.tee 6
        local.get 6
        i32.const 245760
        i32.add
        i32.const 16
        i32.shr_u
        i32.const 2
        i32.and
        local.tee 6
        i32.shl
        i32.const 15
        i32.shr_u
        local.get 5
        local.get 3
        i32.or
        local.get 6
        i32.or
        i32.sub
        local.tee 3
        i32.const 1
        i32.shl
        local.get 1
        local.get 3
        i32.const 21
        i32.add
        i32.shr_u
        i32.const 1
        i32.and
        i32.or
        i32.const 28
        i32.add
        local.set 3
      end
      local.get 0
      i64.const 0
      i64.store offset=16 align=4
      local.get 0
      i32.const 28
      i32.add
      local.get 3
      i32.store
      local.get 3
      i32.const 2
      i32.shl
      i32.const 1058668
      i32.add
      local.set 5
      block  ;; label = @2
        i32.const 0
        i32.load offset=1058368
        local.tee 6
        i32.const 1
        local.get 3
        i32.shl
        local.tee 2
        i32.and
        br_if 0 (;@2;)
        local.get 5
        local.get 0
        i32.store
        i32.const 0
        local.get 6
        local.get 2
        i32.or
        i32.store offset=1058368
        local.get 0
        i32.const 24
        i32.add
        local.get 5
        i32.store
        local.get 0
        local.get 0
        i32.store offset=8
        local.get 0
        local.get 0
        i32.store offset=12
        return
      end
      local.get 1
      i32.const 0
      i32.const 25
      local.get 3
      i32.const 1
      i32.shr_u
      i32.sub
      local.get 3
      i32.const 31
      i32.eq
      select
      i32.shl
      local.set 3
      local.get 5
      i32.load
      local.set 6
      block  ;; label = @2
        loop  ;; label = @3
          local.get 6
          local.tee 5
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 3
          i32.const 29
          i32.shr_u
          local.set 6
          local.get 3
          i32.const 1
          i32.shl
          local.set 3
          local.get 5
          local.get 6
          i32.const 4
          i32.and
          i32.add
          i32.const 16
          i32.add
          local.tee 2
          i32.load
          local.tee 6
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        i32.store
        local.get 0
        i32.const 24
        i32.add
        local.get 5
        i32.store
        local.get 0
        local.get 0
        i32.store offset=12
        local.get 0
        local.get 0
        i32.store offset=8
        return
      end
      local.get 5
      i32.load offset=8
      local.set 1
      local.get 5
      local.get 0
      i32.store offset=8
      local.get 1
      local.get 0
      i32.store offset=12
      local.get 0
      i32.const 24
      i32.add
      i32.const 0
      i32.store
      local.get 0
      local.get 1
      i32.store offset=8
      local.get 0
      local.get 5
      i32.store offset=12
    end)
  (func $internal_memalign (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 16
        local.get 0
        i32.const 16
        i32.gt_u
        select
        local.tee 2
        local.get 2
        i32.const -1
        i32.add
        i32.and
        br_if 0 (;@2;)
        local.get 2
        local.set 0
        br 1 (;@1;)
      end
      i32.const 32
      local.set 3
      loop  ;; label = @2
        local.get 3
        local.tee 0
        i32.const 1
        i32.shl
        local.set 3
        local.get 0
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      i32.const -64
      local.get 0
      i32.sub
      local.get 1
      i32.gt_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 48
      i32.store offset=1058860
      i32.const 0
      return
    end
    block  ;; label = @1
      i32.const 16
      local.get 1
      i32.const 19
      i32.add
      i32.const -16
      i32.and
      local.get 1
      i32.const 11
      i32.lt_u
      select
      local.tee 1
      i32.const 12
      i32.or
      local.get 0
      i32.add
      call $dlmalloc
      local.tee 3
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 3
    i32.const -8
    i32.add
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const -1
        i32.add
        local.get 3
        i32.and
        br_if 0 (;@2;)
        local.get 2
        local.set 0
        br 1 (;@1;)
      end
      local.get 3
      i32.const -4
      i32.add
      local.tee 4
      i32.load
      local.tee 5
      i32.const -8
      i32.and
      local.get 3
      local.get 0
      i32.add
      i32.const -1
      i32.add
      i32.const 0
      local.get 0
      i32.sub
      i32.and
      i32.const -8
      i32.add
      local.tee 3
      local.get 3
      local.get 0
      i32.add
      local.get 3
      local.get 2
      i32.sub
      i32.const 15
      i32.gt_u
      select
      local.tee 0
      local.get 2
      i32.sub
      local.tee 3
      i32.sub
      local.set 6
      block  ;; label = @2
        local.get 5
        i32.const 3
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 6
        i32.store offset=4
        local.get 0
        local.get 2
        i32.load
        local.get 3
        i32.add
        i32.store
        br 1 (;@1;)
      end
      local.get 0
      local.get 6
      local.get 0
      i32.load offset=4
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 6
      i32.add
      local.tee 6
      local.get 6
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 4
      local.get 3
      local.get 4
      i32.load
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store
      local.get 0
      local.get 0
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 2
      local.get 3
      call $dispose_chunk
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 3
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const -8
      i32.and
      local.tee 2
      local.get 1
      i32.const 16
      i32.add
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 3
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 1
      i32.add
      local.tee 3
      local.get 2
      local.get 1
      i32.sub
      local.tee 1
      i32.const 3
      i32.or
      i32.store offset=4
      local.get 0
      local.get 2
      i32.add
      local.tee 2
      local.get 2
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 3
      local.get 1
      call $dispose_chunk
    end
    local.get 0
    i32.const 8
    i32.add)
  (func $aligned_alloc (type 3) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const 16
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      call $dlmalloc
      return
    end
    local.get 0
    local.get 1
    call $internal_memalign)
  (func $_Exit (type 1) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $__wasilibc_populate_libpreopen (type 0)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    i32.const 3
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            local.get 0
            i32.const 8
            i32.add
            call $__wasi_fd_prestat_get
            local.tee 2
            i32.const 8
            i32.gt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                br_table 0 (;@6;) 3 (;@3;) 3 (;@3;) 3 (;@3;) 3 (;@3;) 3 (;@3;) 3 (;@3;) 3 (;@3;) 1 (;@5;) 0 (;@6;)
              end
              block  ;; label = @6
                local.get 0
                i32.load8_u offset=8
                br_if 0 (;@6;)
                local.get 0
                i32.load offset=12
                local.tee 2
                i32.const 1
                i32.add
                call $malloc
                local.tee 3
                i32.eqz
                br_if 4 (;@2;)
                local.get 1
                local.get 3
                local.get 2
                call $__wasi_fd_prestat_dir_name
                br_if 3 (;@3;)
                local.get 3
                local.get 0
                i32.load offset=12
                i32.add
                i32.const 0
                i32.store8
                local.get 1
                i32.const -1
                i32.le_s
                br_if 5 (;@1;)
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1058872
                    local.tee 2
                    i32.const 0
                    i32.load offset=1058868
                    i32.eq
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.load offset=1058864
                    local.set 4
                    br 1 (;@7;)
                  end
                  i32.const 8
                  local.get 2
                  i32.const 1
                  i32.shl
                  i32.const 4
                  local.get 2
                  select
                  local.tee 5
                  call $calloc
                  local.tee 4
                  i32.eqz
                  br_if 5 (;@2;)
                  local.get 4
                  i32.const 0
                  i32.load offset=1058864
                  local.tee 6
                  local.get 2
                  i32.const 3
                  i32.shl
                  call $memcpy
                  local.set 2
                  local.get 6
                  call $free
                  i32.const 0
                  local.get 5
                  i32.store offset=1058868
                  i32.const 0
                  local.get 2
                  i32.store offset=1058864
                  i32.const 0
                  i32.load offset=1058872
                  local.set 2
                end
                i32.const 0
                local.get 2
                i32.const 1
                i32.add
                i32.store offset=1058872
                local.get 4
                local.get 2
                i32.const 3
                i32.shl
                i32.add
                local.tee 2
                local.get 1
                i32.store offset=4
                local.get 2
                local.get 3
                i32.store
              end
              local.get 1
              i32.const 1
              i32.add
              local.tee 2
              local.get 1
              i32.ge_u
              local.set 3
              local.get 2
              local.set 1
              local.get 3
              br_if 1 (;@4;)
            end
          end
          local.get 0
          i32.const 16
          i32.add
          global.set 0
          return
        end
        i32.const 71
        call $_Exit
        unreachable
      end
      i32.const 70
      call $_Exit
      unreachable
    end
    call $abort
    unreachable)
  (func $sbrk (type 5) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      memory.size
      i32.const 16
      i32.shl
      return
    end
    block  ;; label = @1
      local.get 0
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.const 16
        i32.shr_u
        memory.grow
        local.tee 0
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 48
        i32.store offset=1058860
        i32.const -1
        return
      end
      local.get 0
      i32.const 16
      i32.shl
      return
    end
    call $abort
    unreachable)
  (func $__wasilibc_ensure_environ (type 0)
    block  ;; label = @1
      i32.const 0
      i32.load offset=1058880
      i32.const -1
      i32.ne
      br_if 0 (;@1;)
      call $__wasilibc_initialize_environ
    end)
  (func $__wasilibc_initialize_environ (type 0)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 12
          i32.add
          local.get 0
          i32.const 8
          i32.add
          call $__wasi_environ_sizes_get
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 0
            i32.load offset=12
            local.tee 1
            br_if 0 (;@4;)
            i32.const 0
            i32.const 1058876
            i32.store offset=1058880
            br 3 (;@1;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.const 1
              i32.add
              local.tee 2
              local.get 1
              i32.lt_u
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=8
              call $malloc
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.const 4
              call $calloc
              local.tee 1
              br_if 1 (;@4;)
              local.get 3
              call $free
            end
            i32.const 70
            call $_Exit
            unreachable
          end
          local.get 1
          local.get 3
          call $__wasi_environ_get
          i32.eqz
          br_if 1 (;@2;)
          local.get 3
          call $free
          local.get 1
          call $free
        end
        i32.const 71
        call $_Exit
        unreachable
      end
      i32.const 0
      local.get 1
      i32.store offset=1058880
    end
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func $__wasilibc_initialize_environ_eagerly (type 0)
    call $__wasilibc_initialize_environ)
  (func $dummy (type 0))
  (func $__prepare_for_exit (type 0)
    call $dummy
    call $dummy)
  (func $getenv (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32)
    call $__wasilibc_ensure_environ
    i32.const 0
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.const 61
      call $__strchrnul
      local.tee 2
      local.get 0
      i32.sub
      local.tee 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.load8_u
      br_if 0 (;@1;)
      i32.const 0
      i32.load offset=1058880
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const 4
      i32.add
      local.set 4
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 2
            local.get 3
            call $strncmp
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.add
            local.tee 2
            i32.load8_u
            i32.const 61
            i32.eq
            br_if 2 (;@2;)
          end
          local.get 4
          i32.load
          local.set 2
          local.get 4
          i32.const 4
          i32.add
          local.set 4
          local.get 2
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 2
      i32.const 1
      i32.add
      local.set 1
    end
    local.get 1)
  (func $memmove (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        local.get 0
        i32.sub
        local.get 2
        i32.sub
        i32.const 0
        local.get 2
        i32.const 1
        i32.shl
        i32.sub
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 2
        call $memcpy
        drop
        br 1 (;@1;)
      end
      local.get 1
      local.get 0
      i32.xor
      i32.const 3
      i32.and
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 1
            i32.ge_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              local.set 3
              br 3 (;@2;)
            end
            block  ;; label = @5
              local.get 0
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 0
              local.set 3
              br 2 (;@3;)
            end
            local.get 0
            local.set 3
            loop  ;; label = @5
              local.get 2
              i32.eqz
              br_if 4 (;@1;)
              local.get 3
              local.get 1
              i32.load8_u
              i32.store8
              local.get 1
              i32.const 1
              i32.add
              local.set 1
              local.get 2
              i32.const -1
              i32.add
              local.set 2
              local.get 3
              i32.const 1
              i32.add
              local.tee 3
              i32.const 3
              i32.and
              i32.eqz
              br_if 2 (;@3;)
              br 0 (;@5;)
            end
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.set 3
              br 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                local.get 2
                i32.add
                i32.const 3
                i32.and
                br_if 0 (;@6;)
                local.get 2
                local.set 3
                br 1 (;@5;)
              end
              local.get 1
              i32.const -1
              i32.add
              local.set 4
              local.get 0
              i32.const -1
              i32.add
              local.set 5
              loop  ;; label = @6
                local.get 2
                i32.eqz
                br_if 5 (;@1;)
                local.get 5
                local.get 2
                i32.add
                local.tee 6
                local.get 4
                local.get 2
                i32.add
                i32.load8_u
                i32.store8
                local.get 2
                i32.const -1
                i32.add
                local.tee 3
                local.set 2
                local.get 6
                i32.const 3
                i32.and
                br_if 0 (;@6;)
              end
            end
            local.get 3
            i32.const 4
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const -4
            i32.add
            local.set 2
            local.get 1
            i32.const -4
            i32.add
            local.set 6
            loop  ;; label = @5
              local.get 2
              local.get 3
              i32.add
              local.get 6
              local.get 3
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const -4
              i32.add
              local.tee 3
              i32.const 3
              i32.gt_u
              br_if 0 (;@5;)
            end
          end
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 1
          i32.const -1
          i32.add
          local.set 1
          local.get 0
          i32.const -1
          i32.add
          local.set 2
          loop  ;; label = @4
            local.get 2
            local.get 3
            i32.add
            local.get 1
            local.get 3
            i32.add
            i32.load8_u
            i32.store8
            local.get 3
            i32.const -1
            i32.add
            local.tee 3
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 2
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.set 6
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.load
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 3
          i32.const 4
          i32.add
          local.set 3
          local.get 6
          i32.const -4
          i32.add
          local.tee 6
          i32.const 3
          i32.gt_u
          br_if 0 (;@3;)
        end
        local.get 2
        i32.const 3
        i32.and
        local.set 2
      end
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $strerror (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32)
    i32.const 0
    local.set 1
    block  ;; label = @1
      i32.const 0
      i32.load offset=1058908
      local.tee 2
      br_if 0 (;@1;)
      i32.const 1058884
      local.set 2
      i32.const 0
      i32.const 1058884
      i32.store offset=1058908
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            i32.const 1052432
            i32.add
            i32.load8_u
            local.get 0
            i32.eq
            br_if 1 (;@3;)
            i32.const 77
            local.set 3
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.const 77
            i32.ne
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 1
        local.set 3
        local.get 1
        br_if 0 (;@2;)
        i32.const 1052512
        local.set 4
        br 1 (;@1;)
      end
      i32.const 1052512
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.load8_u
        local.set 0
        local.get 1
        i32.const 1
        i32.add
        local.tee 4
        local.set 1
        local.get 0
        br_if 0 (;@2;)
        local.get 4
        local.set 1
        local.get 3
        i32.const -1
        i32.add
        local.tee 3
        br_if 0 (;@2;)
      end
    end
    local.get 4
    local.get 2
    i32.load offset=20
    call $__lctrans)
  (func $strerror_r (type 8) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        call $strerror
        local.tee 0
        call $strlen
        local.tee 3
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 68
        local.set 3
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 0
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        call $memcpy
        local.get 2
        i32.add
        i32.const 0
        i32.store8
        i32.const 68
        return
      end
      local.get 1
      local.get 0
      local.get 3
      i32.const 1
      i32.add
      call $memcpy
      drop
      i32.const 0
      local.set 3
    end
    local.get 3)
  (func $__strchrnul (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 1
      i32.const 255
      i32.and
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 0
            i32.load8_u
            local.tee 3
            i32.eqz
            br_if 2 (;@2;)
            local.get 3
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 0
            i32.const 1
            i32.add
            local.tee 0
            i32.const 3
            i32.and
            br_if 0 (;@4;)
          end
        end
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 3
          i32.const -1
          i32.xor
          local.get 3
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          br_if 0 (;@3;)
          local.get 2
          i32.const 16843009
          i32.mul
          local.set 2
          loop  ;; label = @4
            local.get 3
            local.get 2
            i32.xor
            local.tee 3
            i32.const -1
            i32.xor
            local.get 3
            i32.const -16843009
            i32.add
            i32.and
            i32.const -2139062144
            i32.and
            br_if 1 (;@3;)
            local.get 0
            i32.load offset=4
            local.set 3
            local.get 0
            i32.const 4
            i32.add
            local.set 0
            local.get 3
            i32.const -1
            i32.xor
            local.get 3
            i32.const -16843009
            i32.add
            i32.and
            i32.const -2139062144
            i32.and
            i32.eqz
            br_if 0 (;@4;)
          end
        end
        local.get 0
        i32.const -1
        i32.add
        local.set 0
        loop  ;; label = @3
          local.get 0
          i32.const 1
          i32.add
          local.tee 0
          i32.load8_u
          local.tee 3
          i32.eqz
          br_if 1 (;@2;)
          local.get 3
          local.get 1
          i32.const 255
          i32.and
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 0
      return
    end
    local.get 0
    local.get 0
    call $strlen
    i32.add)
  (func $memcpy (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.set 3
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 2
          i32.const -1
          i32.add
          local.set 4
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 2
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          local.get 4
          local.set 2
          local.get 1
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 2
      local.set 4
      local.get 0
      local.set 3
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.const 3
        i32.and
        local.tee 2
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 4
            i32.const 16
            i32.ge_u
            br_if 0 (;@4;)
            local.get 4
            local.set 2
            br 1 (;@3;)
          end
          local.get 4
          i32.const -16
          i32.add
          local.set 2
          loop  ;; label = @4
            local.get 3
            local.get 1
            i32.load
            i32.store
            local.get 3
            i32.const 4
            i32.add
            local.get 1
            i32.const 4
            i32.add
            i32.load
            i32.store
            local.get 3
            i32.const 8
            i32.add
            local.get 1
            i32.const 8
            i32.add
            i32.load
            i32.store
            local.get 3
            i32.const 12
            i32.add
            local.get 1
            i32.const 12
            i32.add
            i32.load
            i32.store
            local.get 3
            i32.const 16
            i32.add
            local.set 3
            local.get 1
            i32.const 16
            i32.add
            local.set 1
            local.get 4
            i32.const -16
            i32.add
            local.tee 4
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        block  ;; label = @3
          local.get 2
          i32.const 8
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i64.load align=4
          i64.store align=4
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 8
          i32.add
          local.set 3
        end
        block  ;; label = @3
          local.get 2
          i32.const 4
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.load
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 3
          i32.const 4
          i32.add
          local.set 3
        end
        block  ;; label = @3
          local.get 2
          i32.const 2
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 3
          local.get 1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 3
          i32.const 2
          i32.add
          local.set 3
          local.get 1
          i32.const 2
          i32.add
          local.set 1
        end
        local.get 2
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 0
        return
      end
      block  ;; label = @2
        local.get 4
        i32.const 32
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        i32.const 2
        i32.gt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              br_table 0 (;@5;) 1 (;@4;) 2 (;@3;) 0 (;@5;)
            end
            local.get 3
            local.get 1
            i32.load8_u offset=1
            i32.store8 offset=1
            local.get 3
            local.get 1
            i32.load
            local.tee 5
            i32.store8
            local.get 3
            local.get 1
            i32.load8_u offset=2
            i32.store8 offset=2
            local.get 4
            i32.const -3
            i32.add
            local.set 6
            local.get 3
            i32.const 3
            i32.add
            local.set 7
            local.get 4
            i32.const -20
            i32.add
            i32.const -16
            i32.and
            local.set 8
            i32.const 0
            local.set 2
            loop  ;; label = @5
              local.get 7
              local.get 2
              i32.add
              local.tee 3
              local.get 1
              local.get 2
              i32.add
              local.tee 9
              i32.const 4
              i32.add
              i32.load
              local.tee 10
              i32.const 8
              i32.shl
              local.get 5
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 4
              i32.add
              local.get 9
              i32.const 8
              i32.add
              i32.load
              local.tee 5
              i32.const 8
              i32.shl
              local.get 10
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 8
              i32.add
              local.get 9
              i32.const 12
              i32.add
              i32.load
              local.tee 10
              i32.const 8
              i32.shl
              local.get 5
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 12
              i32.add
              local.get 9
              i32.const 16
              i32.add
              i32.load
              local.tee 5
              i32.const 8
              i32.shl
              local.get 10
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 2
              i32.const 16
              i32.add
              local.set 2
              local.get 6
              i32.const -16
              i32.add
              local.tee 6
              i32.const 16
              i32.gt_u
              br_if 0 (;@5;)
            end
            local.get 7
            local.get 2
            i32.add
            local.set 3
            local.get 1
            local.get 2
            i32.add
            i32.const 3
            i32.add
            local.set 1
            local.get 4
            local.get 8
            i32.sub
            i32.const -19
            i32.add
            local.set 4
            br 2 (;@2;)
          end
          local.get 3
          local.get 1
          i32.load
          local.tee 5
          i32.store8
          local.get 3
          local.get 1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 4
          i32.const -2
          i32.add
          local.set 6
          local.get 3
          i32.const 2
          i32.add
          local.set 7
          local.get 4
          i32.const -20
          i32.add
          i32.const -16
          i32.and
          local.set 8
          i32.const 0
          local.set 2
          loop  ;; label = @4
            local.get 7
            local.get 2
            i32.add
            local.tee 3
            local.get 1
            local.get 2
            i32.add
            local.tee 9
            i32.const 4
            i32.add
            i32.load
            local.tee 10
            i32.const 16
            i32.shl
            local.get 5
            i32.const 16
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 4
            i32.add
            local.get 9
            i32.const 8
            i32.add
            i32.load
            local.tee 5
            i32.const 16
            i32.shl
            local.get 10
            i32.const 16
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 8
            i32.add
            local.get 9
            i32.const 12
            i32.add
            i32.load
            local.tee 10
            i32.const 16
            i32.shl
            local.get 5
            i32.const 16
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 12
            i32.add
            local.get 9
            i32.const 16
            i32.add
            i32.load
            local.tee 5
            i32.const 16
            i32.shl
            local.get 10
            i32.const 16
            i32.shr_u
            i32.or
            i32.store
            local.get 2
            i32.const 16
            i32.add
            local.set 2
            local.get 6
            i32.const -16
            i32.add
            local.tee 6
            i32.const 17
            i32.gt_u
            br_if 0 (;@4;)
          end
          local.get 7
          local.get 2
          i32.add
          local.set 3
          local.get 1
          local.get 2
          i32.add
          i32.const 2
          i32.add
          local.set 1
          local.get 4
          local.get 8
          i32.sub
          i32.const -18
          i32.add
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        local.get 1
        i32.load
        local.tee 5
        i32.store8
        local.get 4
        i32.const -1
        i32.add
        local.set 6
        local.get 3
        i32.const 1
        i32.add
        local.set 7
        local.get 4
        i32.const -20
        i32.add
        i32.const -16
        i32.and
        local.set 8
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 7
          local.get 2
          i32.add
          local.tee 3
          local.get 1
          local.get 2
          i32.add
          local.tee 9
          i32.const 4
          i32.add
          i32.load
          local.tee 10
          i32.const 24
          i32.shl
          local.get 5
          i32.const 8
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 4
          i32.add
          local.get 9
          i32.const 8
          i32.add
          i32.load
          local.tee 5
          i32.const 24
          i32.shl
          local.get 10
          i32.const 8
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 8
          i32.add
          local.get 9
          i32.const 12
          i32.add
          i32.load
          local.tee 10
          i32.const 24
          i32.shl
          local.get 5
          i32.const 8
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 12
          i32.add
          local.get 9
          i32.const 16
          i32.add
          i32.load
          local.tee 5
          i32.const 24
          i32.shl
          local.get 10
          i32.const 8
          i32.shr_u
          i32.or
          i32.store
          local.get 2
          i32.const 16
          i32.add
          local.set 2
          local.get 6
          i32.const -16
          i32.add
          local.tee 6
          i32.const 18
          i32.gt_u
          br_if 0 (;@3;)
        end
        local.get 7
        local.get 2
        i32.add
        local.set 3
        local.get 1
        local.get 2
        i32.add
        i32.const 1
        i32.add
        local.set 1
        local.get 4
        local.get 8
        i32.sub
        i32.const -17
        i32.add
        local.set 4
      end
      block  ;; label = @2
        local.get 4
        i32.const 16
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load16_u align=1
        i32.store16 align=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        local.get 1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get 3
        local.get 1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get 3
        local.get 1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get 3
        local.get 1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get 3
        local.get 1
        i32.load8_u offset=8
        i32.store8 offset=8
        local.get 3
        local.get 1
        i32.load8_u offset=9
        i32.store8 offset=9
        local.get 3
        local.get 1
        i32.load8_u offset=10
        i32.store8 offset=10
        local.get 3
        local.get 1
        i32.load8_u offset=11
        i32.store8 offset=11
        local.get 3
        local.get 1
        i32.load8_u offset=12
        i32.store8 offset=12
        local.get 3
        local.get 1
        i32.load8_u offset=13
        i32.store8 offset=13
        local.get 3
        local.get 1
        i32.load8_u offset=14
        i32.store8 offset=14
        local.get 3
        local.get 1
        i32.load8_u offset=15
        i32.store8 offset=15
        local.get 3
        i32.const 16
        i32.add
        local.set 3
        local.get 1
        i32.const 16
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 4
        i32.const 8
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        local.get 1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get 3
        local.get 1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get 3
        local.get 1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get 3
        local.get 1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        local.get 1
        i32.const 8
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 4
        i32.const 4
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        local.get 1
        i32.const 4
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 4
        i32.const 2
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        i32.const 2
        i32.add
        local.set 3
        local.get 1
        i32.const 2
        i32.add
        local.set 1
      end
      local.get 4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.load8_u
      i32.store8
    end
    local.get 0)
  (func $memset (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 2
      local.get 0
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.tee 3
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 1
      i32.store
      local.get 3
      local.get 2
      local.get 4
      i32.sub
      i32.const -4
      i32.and
      local.tee 4
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 1
      i32.store
      local.get 4
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=8
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 1
      i32.store
      local.get 4
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=24
      local.get 3
      local.get 1
      i32.store offset=20
      local.get 3
      local.get 1
      i32.store offset=16
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 2
      i32.const -16
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -24
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 1
      i32.store
      local.get 4
      local.get 3
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 5
      i32.sub
      local.tee 2
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      i64.extend_i32_u
      local.tee 6
      i64.const 32
      i64.shl
      local.get 6
      i64.or
      local.set 6
      local.get 3
      local.get 5
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        local.get 6
        i64.store
        local.get 1
        i32.const 24
        i32.add
        local.get 6
        i64.store
        local.get 1
        i32.const 16
        i32.add
        local.get 6
        i64.store
        local.get 1
        i32.const 8
        i32.add
        local.get 6
        i64.store
        local.get 1
        i32.const 32
        i32.add
        local.set 1
        local.get 2
        i32.const -32
        i32.add
        local.tee 2
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $strncmp (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 2
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.load8_u
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.add
      local.set 0
      local.get 2
      i32.const -1
      i32.add
      local.set 2
      loop  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const 255
          i32.and
          local.get 1
          i32.load8_u
          local.tee 5
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        i32.const -1
        i32.add
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 0
        i32.load8_u
        local.set 4
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 4
        br_if 0 (;@2;)
      end
    end
    local.get 3
    i32.const 255
    i32.and
    local.get 1
    i32.load8_u
    i32.sub)
  (func $memcmp (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 4
          local.get 1
          i32.load8_u
          local.tee 5
          i32.ne
          br_if 1 (;@2;)
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 2
          i32.const -1
          i32.add
          local.tee 2
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 4
      local.get 5
      i32.sub
      local.set 3
    end
    local.get 3)
  (func $strlen (type 5) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 0
            i32.load8_u
            br_if 0 (;@4;)
            local.get 0
            local.get 0
            i32.sub
            return
          end
          local.get 0
          i32.const 1
          i32.add
          local.set 1
          loop  ;; label = @4
            local.get 1
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 1
            i32.load8_u
            local.set 2
            local.get 1
            i32.const 1
            i32.add
            local.tee 3
            local.set 1
            local.get 2
            i32.eqz
            br_if 2 (;@2;)
            br 0 (;@4;)
          end
        end
        local.get 1
        i32.const -4
        i32.add
        local.set 1
        loop  ;; label = @3
          local.get 1
          i32.const 4
          i32.add
          local.tee 1
          i32.load
          local.tee 2
          i32.const -1
          i32.xor
          local.get 2
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          i32.eqz
          br_if 0 (;@3;)
        end
        block  ;; label = @3
          local.get 2
          i32.const 255
          i32.and
          br_if 0 (;@3;)
          local.get 1
          local.get 0
          i32.sub
          return
        end
        loop  ;; label = @3
          local.get 1
          i32.load8_u offset=1
          local.set 2
          local.get 1
          i32.const 1
          i32.add
          local.tee 3
          local.set 1
          local.get 2
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 3
      i32.const -1
      i32.add
      local.set 3
    end
    local.get 3
    local.get 0
    i32.sub)
  (func $dummy.1 (type 3) (param i32 i32) (result i32)
    local.get 0)
  (func $__lctrans (type 3) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $dummy.1)
  (func $_ZN5alloc5alloc18handle_alloc_error17h21de29b39e387441E (type 6) (param i32 i32)
    local.get 0
    local.get 1
    call $rust_oom
    unreachable)
  (func $_ZN5alloc7raw_vec17capacity_overflow17h232763bca8857af5E (type 0)
    i32.const 1054109
    i32.const 17
    i32.const 1054128
    call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
    unreachable)
  (func $_ZN5alloc6string104_$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..vec..Vec$LT$u8$GT$$GT$4from17h4fac04ba81ae9773E (type 6) (param i32 i32)
    local.get 0
    local.get 1
    i64.load align=4
    i64.store align=4
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i32.load
    i32.store)
  (func $_ZN5alloc3vec12Vec$LT$T$GT$5drain17end_assert_failed17h686d263f81d07b88E (type 6) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.const 28
    i32.add
    i32.const 2
    i32.store
    local.get 2
    i32.const 44
    i32.add
    i32.const 13
    i32.store
    local.get 2
    i64.const 3
    i64.store offset=12 align=4
    local.get 2
    i32.const 1054208
    i32.store offset=8
    local.get 2
    i32.const 13
    i32.store offset=36
    local.get 2
    local.get 2
    i32.const 32
    i32.add
    i32.store offset=24
    local.get 2
    local.get 2
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 2
    local.get 2
    i32.store offset=32
    local.get 2
    i32.const 8
    i32.add
    i32.const 1054232
    call $_ZN4core9panicking9panic_fmt17h161ef327f1d4058dE
    unreachable)
  (func $_ZN4core3ops8function6FnOnce9call_once17hbe6f8b545009bafbE (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    drop
    loop (result i32)  ;; label = @1
      br 0 (;@1;)
    end)
  (func $_ZN4core3ptr13drop_in_place17h0204d3c859ff1c91E (type 1) (param i32))
  (func $_ZN4core9panicking18panic_bounds_check17h66b04f407ccd9a1eE (type 7) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 28
    i32.add
    i32.const 2
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 13
    i32.store
    local.get 3
    i64.const 2
    i64.store offset=12 align=4
    local.get 3
    i32.const 1054452
    i32.store offset=8
    local.get 3
    i32.const 13
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=24
    local.get 3
    local.get 3
    i32.store offset=40
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h161ef327f1d4058dE
    unreachable)
  (func $_ZN4core9panicking5panic17he0bb7a4a857bed0cE (type 7) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 20
    i32.add
    i32.const 0
    i32.store
    local.get 3
    i32.const 1054248
    i32.store offset=16
    local.get 3
    i64.const 1
    i64.store offset=4 align=4
    local.get 3
    local.get 1
    i32.store offset=28
    local.get 3
    local.get 0
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 24
    i32.add
    i32.store
    local.get 3
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h161ef327f1d4058dE
    unreachable)
  (func $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E (type 7) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 28
    i32.add
    i32.const 2
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 13
    i32.store
    local.get 3
    i64.const 2
    i64.store offset=12 align=4
    local.get 3
    i32.const 1054972
    i32.store offset=8
    local.get 3
    i32.const 13
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h161ef327f1d4058dE
    unreachable)
  (func $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE (type 7) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 28
    i32.add
    i32.const 2
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 13
    i32.store
    local.get 3
    i64.const 2
    i64.store offset=12 align=4
    local.get 3
    i32.const 1055024
    i32.store offset=8
    local.get 3
    i32.const 13
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h161ef327f1d4058dE
    unreachable)
  (func $_ZN4core3fmt9Formatter3pad17h5d1a27371f812187E (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=16
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 4
            i32.const 1
            i32.eq
            br_if 0 (;@4;)
            local.get 3
            i32.const 1
            i32.eq
            br_if 1 (;@3;)
            local.get 0
            i32.load offset=24
            local.get 1
            local.get 2
            local.get 0
            i32.const 28
            i32.add
            i32.load
            i32.load offset=12
            call_indirect (type 8)
            local.set 3
            br 3 (;@1;)
          end
          local.get 3
          i32.const 1
          i32.ne
          br_if 1 (;@2;)
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            i32.const 0
            local.set 2
            br 1 (;@3;)
          end
          local.get 1
          local.get 2
          i32.add
          local.set 5
          local.get 0
          i32.const 20
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.set 6
          i32.const 0
          local.set 7
          local.get 1
          local.set 3
          local.get 1
          local.set 8
          loop  ;; label = @4
            local.get 3
            i32.const 1
            i32.add
            local.set 9
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.load8_s
                  local.tee 10
                  i32.const -1
                  i32.gt_s
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 9
                      local.get 5
                      i32.ne
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 11
                      local.get 5
                      local.set 3
                      br 1 (;@8;)
                    end
                    local.get 3
                    i32.load8_u offset=1
                    i32.const 63
                    i32.and
                    local.set 11
                    local.get 3
                    i32.const 2
                    i32.add
                    local.tee 9
                    local.set 3
                  end
                  local.get 10
                  i32.const 31
                  i32.and
                  local.set 12
                  block  ;; label = @8
                    local.get 10
                    i32.const 255
                    i32.and
                    local.tee 10
                    i32.const 223
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 11
                    local.get 12
                    i32.const 6
                    i32.shl
                    i32.or
                    local.set 10
                    br 2 (;@6;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 3
                      local.get 5
                      i32.ne
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 13
                      local.get 5
                      local.set 14
                      br 1 (;@8;)
                    end
                    local.get 3
                    i32.load8_u
                    i32.const 63
                    i32.and
                    local.set 13
                    local.get 3
                    i32.const 1
                    i32.add
                    local.tee 9
                    local.set 14
                  end
                  local.get 13
                  local.get 11
                  i32.const 6
                  i32.shl
                  i32.or
                  local.set 11
                  block  ;; label = @8
                    local.get 10
                    i32.const 240
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 11
                    local.get 12
                    i32.const 12
                    i32.shl
                    i32.or
                    local.set 10
                    br 2 (;@6;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 14
                      local.get 5
                      i32.ne
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 10
                      local.get 9
                      local.set 3
                      br 1 (;@8;)
                    end
                    local.get 14
                    i32.const 1
                    i32.add
                    local.set 3
                    local.get 14
                    i32.load8_u
                    i32.const 63
                    i32.and
                    local.set 10
                  end
                  local.get 11
                  i32.const 6
                  i32.shl
                  local.get 12
                  i32.const 18
                  i32.shl
                  i32.const 1835008
                  i32.and
                  i32.or
                  local.get 10
                  i32.or
                  local.tee 10
                  i32.const 1114112
                  i32.ne
                  br_if 2 (;@5;)
                  br 4 (;@3;)
                end
                local.get 10
                i32.const 255
                i32.and
                local.set 10
              end
              local.get 9
              local.set 3
            end
            block  ;; label = @5
              local.get 6
              i32.const -1
              i32.add
              local.tee 6
              i32.eqz
              br_if 0 (;@5;)
              local.get 7
              local.get 8
              i32.sub
              local.get 3
              i32.add
              local.set 7
              local.get 3
              local.set 8
              local.get 5
              local.get 3
              i32.ne
              br_if 1 (;@4;)
              br 2 (;@3;)
            end
          end
          local.get 10
          i32.const 1114112
          i32.eq
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.eqz
              br_if 0 (;@5;)
              local.get 7
              local.get 2
              i32.eq
              br_if 0 (;@5;)
              i32.const 0
              local.set 3
              local.get 7
              local.get 2
              i32.ge_u
              br_if 1 (;@4;)
              local.get 1
              local.get 7
              i32.add
              i32.load8_s
              i32.const -64
              i32.lt_s
              br_if 1 (;@4;)
            end
            local.get 1
            local.set 3
          end
          local.get 7
          local.get 2
          local.get 3
          select
          local.set 2
          local.get 3
          local.get 1
          local.get 3
          select
          local.set 1
        end
        local.get 4
        i32.const 1
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=24
        local.get 1
        local.get 2
        local.get 0
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        return
      end
      i32.const 0
      local.set 9
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.set 10
        local.get 1
        local.set 3
        loop  ;; label = @3
          local.get 9
          local.get 3
          i32.load8_u
          i32.const 192
          i32.and
          i32.const 128
          i32.eq
          i32.add
          local.set 9
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 10
          i32.const -1
          i32.add
          local.tee 10
          br_if 0 (;@3;)
        end
      end
      block  ;; label = @2
        local.get 2
        local.get 9
        i32.sub
        local.get 0
        i32.load offset=12
        local.tee 6
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=24
        local.get 1
        local.get 2
        local.get 0
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        return
      end
      i32.const 0
      local.set 7
      i32.const 0
      local.set 9
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 9
        local.get 2
        local.set 10
        local.get 1
        local.set 3
        loop  ;; label = @3
          local.get 9
          local.get 3
          i32.load8_u
          i32.const 192
          i32.and
          i32.const 128
          i32.eq
          i32.add
          local.set 9
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 10
          i32.const -1
          i32.add
          local.tee 10
          br_if 0 (;@3;)
        end
      end
      local.get 9
      local.get 2
      i32.sub
      local.get 6
      i32.add
      local.tee 9
      local.set 10
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            local.get 0
            i32.load8_u offset=32
            local.tee 3
            local.get 3
            i32.const 3
            i32.eq
            select
            br_table 2 (;@2;) 1 (;@3;) 0 (;@4;) 1 (;@3;) 2 (;@2;)
          end
          local.get 9
          i32.const 1
          i32.shr_u
          local.set 7
          local.get 9
          i32.const 1
          i32.add
          i32.const 1
          i32.shr_u
          local.set 10
          br 1 (;@2;)
        end
        i32.const 0
        local.set 10
        local.get 9
        local.set 7
      end
      local.get 7
      i32.const 1
      i32.add
      local.set 3
      block  ;; label = @2
        loop  ;; label = @3
          local.get 3
          i32.const -1
          i32.add
          local.tee 3
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=24
          local.get 0
          i32.load offset=4
          local.get 0
          i32.load offset=28
          i32.load offset=16
          call_indirect (type 3)
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 1
        return
      end
      local.get 0
      i32.load offset=4
      local.set 9
      i32.const 1
      local.set 3
      local.get 0
      i32.load offset=24
      local.get 1
      local.get 2
      local.get 0
      i32.load offset=28
      i32.load offset=12
      call_indirect (type 8)
      br_if 0 (;@1;)
      local.get 10
      i32.const 1
      i32.add
      local.set 3
      local.get 0
      i32.load offset=28
      local.set 10
      local.get 0
      i32.load offset=24
      local.set 0
      loop  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const -1
          i32.add
          local.tee 3
          br_if 0 (;@3;)
          i32.const 0
          return
        end
        local.get 0
        local.get 9
        local.get 10
        i32.load offset=16
        call_indirect (type 3)
        i32.eqz
        br_if 0 (;@2;)
      end
      i32.const 1
      return
    end
    local.get 3)
  (func $_ZN4core3str16slice_error_fail17he0dcaa8f825738e6E (type 10) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 112
    i32.sub
    local.tee 5
    global.set 0
    local.get 5
    local.get 3
    i32.store offset=12
    local.get 5
    local.get 2
    i32.store offset=8
    i32.const 1
    local.set 6
    local.get 1
    local.set 7
    block  ;; label = @1
      local.get 1
      i32.const 257
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 0
      local.get 1
      i32.sub
      local.set 8
      i32.const 256
      local.set 9
      loop  ;; label = @2
        block  ;; label = @3
          local.get 9
          local.get 1
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 6
          local.get 0
          local.get 9
          i32.add
          i32.load8_s
          i32.const -65
          i32.le_s
          br_if 0 (;@3;)
          local.get 9
          local.set 7
          br 2 (;@1;)
        end
        local.get 9
        i32.const -1
        i32.add
        local.set 7
        i32.const 0
        local.set 6
        local.get 9
        i32.const 1
        i32.eq
        br_if 1 (;@1;)
        local.get 8
        local.get 9
        i32.add
        local.set 10
        local.get 7
        local.set 9
        local.get 10
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 5
    local.get 7
    i32.store offset=20
    local.get 5
    local.get 0
    i32.store offset=16
    local.get 5
    i32.const 0
    i32.const 5
    local.get 6
    select
    i32.store offset=28
    local.get 5
    i32.const 1054248
    i32.const 1055644
    local.get 6
    select
    i32.store offset=24
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            local.get 1
            i32.gt_u
            local.tee 6
            br_if 0 (;@4;)
            local.get 3
            local.get 1
            i32.gt_u
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.gt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                local.get 2
                i32.eq
                br_if 0 (;@6;)
                local.get 1
                local.get 2
                i32.le_u
                br_if 1 (;@5;)
                local.get 0
                local.get 2
                i32.add
                i32.load8_s
                i32.const -64
                i32.lt_s
                br_if 1 (;@5;)
              end
              local.get 3
              local.set 2
            end
            local.get 5
            local.get 2
            i32.store offset=32
            local.get 2
            i32.eqz
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.eq
            br_if 2 (;@2;)
            local.get 1
            i32.const 1
            i32.add
            local.set 9
            loop  ;; label = @5
              block  ;; label = @6
                local.get 2
                local.get 1
                i32.ge_u
                br_if 0 (;@6;)
                local.get 0
                local.get 2
                i32.add
                i32.load8_s
                i32.const -64
                i32.ge_s
                br_if 4 (;@2;)
              end
              local.get 2
              i32.const -1
              i32.add
              local.set 6
              local.get 2
              i32.const 1
              i32.eq
              br_if 4 (;@1;)
              local.get 9
              local.get 2
              i32.eq
              local.set 3
              local.get 6
              local.set 2
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              br 4 (;@1;)
            end
          end
          local.get 5
          local.get 2
          local.get 3
          local.get 6
          select
          i32.store offset=40
          local.get 5
          i32.const 48
          i32.add
          i32.const 20
          i32.add
          i32.const 3
          i32.store
          local.get 5
          i32.const 72
          i32.add
          i32.const 20
          i32.add
          i32.const 79
          i32.store
          local.get 5
          i32.const 84
          i32.add
          i32.const 79
          i32.store
          local.get 5
          i64.const 3
          i64.store offset=52 align=4
          local.get 5
          i32.const 1055684
          i32.store offset=48
          local.get 5
          i32.const 13
          i32.store offset=76
          local.get 5
          local.get 5
          i32.const 72
          i32.add
          i32.store offset=64
          local.get 5
          local.get 5
          i32.const 24
          i32.add
          i32.store offset=88
          local.get 5
          local.get 5
          i32.const 16
          i32.add
          i32.store offset=80
          local.get 5
          local.get 5
          i32.const 40
          i32.add
          i32.store offset=72
          local.get 5
          i32.const 48
          i32.add
          local.get 4
          call $_ZN4core9panicking9panic_fmt17h161ef327f1d4058dE
          unreachable
        end
        local.get 5
        i32.const 100
        i32.add
        i32.const 79
        i32.store
        local.get 5
        i32.const 72
        i32.add
        i32.const 20
        i32.add
        i32.const 79
        i32.store
        local.get 5
        i32.const 84
        i32.add
        i32.const 13
        i32.store
        local.get 5
        i32.const 48
        i32.add
        i32.const 20
        i32.add
        i32.const 4
        i32.store
        local.get 5
        i64.const 4
        i64.store offset=52 align=4
        local.get 5
        i32.const 1055744
        i32.store offset=48
        local.get 5
        i32.const 13
        i32.store offset=76
        local.get 5
        local.get 5
        i32.const 72
        i32.add
        i32.store offset=64
        local.get 5
        local.get 5
        i32.const 24
        i32.add
        i32.store offset=96
        local.get 5
        local.get 5
        i32.const 16
        i32.add
        i32.store offset=88
        local.get 5
        local.get 5
        i32.const 12
        i32.add
        i32.store offset=80
        local.get 5
        local.get 5
        i32.const 8
        i32.add
        i32.store offset=72
        local.get 5
        i32.const 48
        i32.add
        local.get 4
        call $_ZN4core9panicking9panic_fmt17h161ef327f1d4058dE
        unreachable
      end
      local.get 2
      local.set 6
    end
    block  ;; label = @1
      local.get 6
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      i32.const 1
      local.set 9
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              local.get 6
              i32.add
              local.tee 3
              i32.load8_s
              local.tee 2
              i32.const -1
              i32.gt_s
              br_if 0 (;@5;)
              i32.const 0
              local.set 9
              local.get 0
              local.get 1
              i32.add
              local.tee 1
              local.set 7
              block  ;; label = @6
                local.get 3
                i32.const 1
                i32.add
                local.get 1
                i32.eq
                br_if 0 (;@6;)
                local.get 3
                i32.const 2
                i32.add
                local.set 7
                local.get 3
                i32.load8_u offset=1
                i32.const 63
                i32.and
                local.set 9
              end
              local.get 2
              i32.const 31
              i32.and
              local.set 3
              local.get 2
              i32.const 255
              i32.and
              i32.const 223
              i32.gt_u
              br_if 1 (;@4;)
              local.get 9
              local.get 3
              i32.const 6
              i32.shl
              i32.or
              local.set 2
              br 2 (;@3;)
            end
            local.get 5
            local.get 2
            i32.const 255
            i32.and
            i32.store offset=36
            local.get 5
            i32.const 40
            i32.add
            local.set 1
            br 2 (;@2;)
          end
          i32.const 0
          local.set 0
          local.get 1
          local.set 8
          block  ;; label = @4
            local.get 7
            local.get 1
            i32.eq
            br_if 0 (;@4;)
            local.get 7
            i32.const 1
            i32.add
            local.set 8
            local.get 7
            i32.load8_u
            i32.const 63
            i32.and
            local.set 0
          end
          local.get 0
          local.get 9
          i32.const 6
          i32.shl
          i32.or
          local.set 9
          block  ;; label = @4
            local.get 2
            i32.const 255
            i32.and
            i32.const 240
            i32.ge_u
            br_if 0 (;@4;)
            local.get 9
            local.get 3
            i32.const 12
            i32.shl
            i32.or
            local.set 2
            br 1 (;@3;)
          end
          i32.const 0
          local.set 2
          block  ;; label = @4
            local.get 8
            local.get 1
            i32.eq
            br_if 0 (;@4;)
            local.get 8
            i32.load8_u
            i32.const 63
            i32.and
            local.set 2
          end
          local.get 9
          i32.const 6
          i32.shl
          local.get 3
          i32.const 18
          i32.shl
          i32.const 1835008
          i32.and
          i32.or
          local.get 2
          i32.or
          local.tee 2
          i32.const 1114112
          i32.eq
          br_if 2 (;@1;)
        end
        local.get 5
        local.get 2
        i32.store offset=36
        i32.const 1
        local.set 9
        local.get 5
        i32.const 40
        i32.add
        local.set 1
        local.get 2
        i32.const 128
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 2
        local.set 9
        local.get 2
        i32.const 2048
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 3
        i32.const 4
        local.get 2
        i32.const 65536
        i32.lt_u
        select
        local.set 9
      end
      local.get 5
      local.get 6
      i32.store offset=40
      local.get 5
      local.get 9
      local.get 6
      i32.add
      i32.store offset=44
      local.get 5
      i32.const 48
      i32.add
      i32.const 20
      i32.add
      i32.const 5
      i32.store
      local.get 5
      i32.const 108
      i32.add
      i32.const 79
      i32.store
      local.get 5
      i32.const 100
      i32.add
      i32.const 79
      i32.store
      local.get 5
      i32.const 72
      i32.add
      i32.const 20
      i32.add
      i32.const 80
      i32.store
      local.get 5
      i32.const 84
      i32.add
      i32.const 81
      i32.store
      local.get 5
      i64.const 5
      i64.store offset=52 align=4
      local.get 5
      i32.const 1055828
      i32.store offset=48
      local.get 5
      local.get 1
      i32.store offset=88
      local.get 5
      i32.const 13
      i32.store offset=76
      local.get 5
      local.get 5
      i32.const 72
      i32.add
      i32.store offset=64
      local.get 5
      local.get 5
      i32.const 24
      i32.add
      i32.store offset=104
      local.get 5
      local.get 5
      i32.const 16
      i32.add
      i32.store offset=96
      local.get 5
      local.get 5
      i32.const 36
      i32.add
      i32.store offset=80
      local.get 5
      local.get 5
      i32.const 32
      i32.add
      i32.store offset=72
      local.get 5
      i32.const 48
      i32.add
      local.get 4
      call $_ZN4core9panicking9panic_fmt17h161ef327f1d4058dE
      unreachable
    end
    i32.const 1054285
    i32.const 43
    local.get 4
    call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
    unreachable)
  (func $_ZN4core9panicking9panic_fmt17h161ef327f1d4058dE (type 6) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    i32.const 1054356
    i32.store offset=4
    local.get 2
    i32.const 1054248
    i32.store
    local.get 2
    call $rust_begin_unwind
    unreachable)
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17he6ead8fc076aace0E (type 3) (param i32 i32) (result i32)
    local.get 0
    i64.load32_u
    i32.const 1
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h34d165111a85fc91E)
  (func $_ZN4core3fmt5write17hf78275652148e08fE (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 36
    i32.add
    local.get 1
    i32.store
    local.get 3
    i32.const 3
    i32.store8 offset=40
    local.get 3
    i64.const 137438953472
    i64.store offset=8
    local.get 3
    local.get 0
    i32.store offset=32
    local.get 3
    i32.const 0
    i32.store offset=24
    local.get 3
    i32.const 0
    i32.store offset=16
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=8
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.load
              local.set 5
              local.get 2
              i32.load offset=4
              local.tee 6
              local.get 2
              i32.const 12
              i32.add
              i32.load
              local.tee 7
              local.get 7
              local.get 6
              i32.gt_u
              select
              local.tee 7
              i32.eqz
              br_if 1 (;@4;)
              local.get 2
              i32.const 20
              i32.add
              i32.load
              local.set 8
              local.get 2
              i32.load offset=16
              local.set 9
              local.get 0
              local.get 5
              i32.load
              local.get 5
              i32.load offset=4
              local.get 1
              i32.load offset=12
              call_indirect (type 8)
              br_if 3 (;@2;)
              local.get 5
              i32.const 12
              i32.add
              local.set 2
              i32.const 0
              local.set 10
              block  ;; label = @6
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 3
                    local.get 4
                    i32.const 4
                    i32.add
                    i32.load
                    i32.store offset=12
                    local.get 3
                    local.get 4
                    i32.const 28
                    i32.add
                    i32.load8_u
                    i32.store8 offset=40
                    local.get 3
                    local.get 4
                    i32.const 8
                    i32.add
                    i32.load
                    i32.store offset=8
                    local.get 4
                    i32.const 24
                    i32.add
                    i32.load
                    local.set 0
                    i32.const 0
                    local.set 1
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 4
                          i32.const 20
                          i32.add
                          i32.load
                          br_table 1 (;@10;) 0 (;@11;) 2 (;@9;) 1 (;@10;)
                        end
                        local.get 0
                        local.get 8
                        i32.ge_u
                        br_if 3 (;@7;)
                        local.get 0
                        i32.const 3
                        i32.shl
                        local.set 11
                        i32.const 0
                        local.set 1
                        local.get 9
                        local.get 11
                        i32.add
                        local.tee 11
                        i32.load offset=4
                        i32.const 82
                        i32.ne
                        br_if 1 (;@9;)
                        local.get 11
                        i32.load
                        i32.load
                        local.set 0
                      end
                      i32.const 1
                      local.set 1
                    end
                    local.get 3
                    local.get 0
                    i32.store offset=20
                    local.get 3
                    local.get 1
                    i32.store offset=16
                    local.get 4
                    i32.const 16
                    i32.add
                    i32.load
                    local.set 0
                    i32.const 0
                    local.set 1
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 4
                          i32.const 12
                          i32.add
                          i32.load
                          br_table 1 (;@10;) 0 (;@11;) 2 (;@9;) 1 (;@10;)
                        end
                        local.get 0
                        local.get 8
                        i32.ge_u
                        br_if 4 (;@6;)
                        local.get 0
                        i32.const 3
                        i32.shl
                        local.set 11
                        local.get 9
                        local.get 11
                        i32.add
                        local.tee 11
                        i32.load offset=4
                        i32.const 82
                        i32.ne
                        br_if 1 (;@9;)
                        local.get 11
                        i32.load
                        i32.load
                        local.set 0
                      end
                      i32.const 1
                      local.set 1
                    end
                    local.get 3
                    local.get 0
                    i32.store offset=28
                    local.get 3
                    local.get 1
                    i32.store offset=24
                    block  ;; label = @9
                      local.get 4
                      i32.load
                      local.tee 0
                      local.get 8
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 9
                      local.get 0
                      i32.const 3
                      i32.shl
                      i32.add
                      local.tee 0
                      i32.load
                      local.get 3
                      i32.const 8
                      i32.add
                      local.get 0
                      i32.load offset=4
                      call_indirect (type 3)
                      br_if 7 (;@2;)
                      local.get 10
                      i32.const 1
                      i32.add
                      local.tee 10
                      local.get 7
                      i32.ge_u
                      br_if 6 (;@3;)
                      local.get 4
                      i32.const 32
                      i32.add
                      local.set 4
                      local.get 2
                      i32.const -4
                      i32.add
                      local.set 0
                      local.get 2
                      i32.load
                      local.set 1
                      local.get 2
                      i32.const 8
                      i32.add
                      local.set 2
                      local.get 3
                      i32.load offset=32
                      local.get 0
                      i32.load
                      local.get 1
                      local.get 3
                      i32.load offset=36
                      i32.load offset=12
                      call_indirect (type 8)
                      i32.eqz
                      br_if 1 (;@8;)
                      br 7 (;@2;)
                    end
                  end
                  local.get 0
                  local.get 8
                  i32.const 1054824
                  call $_ZN4core9panicking18panic_bounds_check17h66b04f407ccd9a1eE
                  unreachable
                end
                local.get 0
                local.get 8
                i32.const 1054840
                call $_ZN4core9panicking18panic_bounds_check17h66b04f407ccd9a1eE
                unreachable
              end
              local.get 0
              local.get 8
              i32.const 1054840
              call $_ZN4core9panicking18panic_bounds_check17h66b04f407ccd9a1eE
              unreachable
            end
            local.get 2
            i32.load
            local.set 5
            local.get 2
            i32.load offset=4
            local.tee 6
            local.get 2
            i32.const 20
            i32.add
            i32.load
            local.tee 4
            local.get 4
            local.get 6
            i32.gt_u
            select
            local.tee 7
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.load offset=16
            local.set 4
            local.get 0
            local.get 5
            i32.load
            local.get 5
            i32.load offset=4
            local.get 1
            i32.load offset=12
            call_indirect (type 8)
            br_if 2 (;@2;)
            local.get 5
            i32.const 12
            i32.add
            local.set 2
            i32.const 0
            local.set 0
            loop  ;; label = @5
              local.get 4
              i32.load
              local.get 3
              i32.const 8
              i32.add
              local.get 4
              i32.const 4
              i32.add
              i32.load
              call_indirect (type 3)
              br_if 3 (;@2;)
              local.get 0
              i32.const 1
              i32.add
              local.tee 0
              local.get 7
              i32.ge_u
              br_if 2 (;@3;)
              local.get 4
              i32.const 8
              i32.add
              local.set 4
              local.get 2
              i32.const -4
              i32.add
              local.set 1
              local.get 2
              i32.load
              local.set 10
              local.get 2
              i32.const 8
              i32.add
              local.set 2
              local.get 3
              i32.load offset=32
              local.get 1
              i32.load
              local.get 10
              local.get 3
              i32.load offset=36
              i32.load offset=12
              call_indirect (type 8)
              i32.eqz
              br_if 0 (;@5;)
              br 3 (;@2;)
            end
          end
          i32.const 0
          local.set 7
        end
        block  ;; label = @3
          local.get 6
          local.get 7
          i32.le_u
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=32
          local.get 5
          local.get 7
          i32.const 3
          i32.shl
          i32.add
          local.tee 4
          i32.load
          local.get 4
          i32.load offset=4
          local.get 3
          i32.load offset=36
          i32.load offset=12
          call_indirect (type 8)
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      i32.const 1
      local.set 4
    end
    local.get 3
    i32.const 48
    i32.add
    global.set 0
    local.get 4)
  (func $_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h94ceed4e1d7d3c8dE (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 1
        call $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h264ea309efcc35d6E
        br_if 0 (;@2;)
        local.get 1
        i32.const 28
        i32.add
        i32.load
        local.set 3
        local.get 1
        i32.load offset=24
        local.set 4
        local.get 2
        i32.const 28
        i32.add
        i32.const 0
        i32.store
        local.get 2
        i32.const 1054248
        i32.store offset=24
        local.get 2
        i64.const 1
        i64.store offset=12 align=4
        local.get 2
        i32.const 1054252
        i32.store offset=8
        local.get 4
        local.get 3
        local.get 2
        i32.const 8
        i32.add
        call $_ZN4core3fmt5write17hf78275652148e08fE
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 2
      i32.const 32
      i32.add
      global.set 0
      i32.const 1
      return
    end
    local.get 0
    i32.const 4
    i32.add
    local.get 1
    call $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h264ea309efcc35d6E
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h264ea309efcc35d6E (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load
              local.tee 3
              i32.const 16
              i32.and
              br_if 0 (;@5;)
              local.get 0
              i32.load
              local.set 4
              local.get 3
              i32.const 32
              i32.and
              br_if 1 (;@4;)
              local.get 4
              i64.extend_i32_u
              i32.const 1
              local.get 1
              call $_ZN4core3fmt3num3imp7fmt_u6417h34d165111a85fc91E
              local.set 0
              br 2 (;@3;)
            end
            local.get 0
            i32.load
            local.set 4
            i32.const 0
            local.set 0
            loop  ;; label = @5
              local.get 2
              local.get 0
              i32.add
              i32.const 127
              i32.add
              local.get 4
              i32.const 15
              i32.and
              local.tee 3
              i32.const 48
              i32.or
              local.get 3
              i32.const 87
              i32.add
              local.get 3
              i32.const 10
              i32.lt_u
              select
              i32.store8
              local.get 0
              i32.const -1
              i32.add
              local.set 0
              local.get 4
              i32.const 4
              i32.shr_u
              local.tee 4
              br_if 0 (;@5;)
            end
            local.get 0
            i32.const 128
            i32.add
            local.tee 4
            i32.const 129
            i32.ge_u
            br_if 2 (;@2;)
            local.get 1
            i32.const 1
            i32.const 1054572
            i32.const 2
            local.get 2
            local.get 0
            i32.add
            i32.const 128
            i32.add
            i32.const 0
            local.get 0
            i32.sub
            call $_ZN4core3fmt9Formatter12pad_integral17h56cb6b936c09c882E
            local.set 0
            br 1 (;@3;)
          end
          i32.const 0
          local.set 0
          loop  ;; label = @4
            local.get 2
            local.get 0
            i32.add
            i32.const 127
            i32.add
            local.get 4
            i32.const 15
            i32.and
            local.tee 3
            i32.const 48
            i32.or
            local.get 3
            i32.const 55
            i32.add
            local.get 3
            i32.const 10
            i32.lt_u
            select
            i32.store8
            local.get 0
            i32.const -1
            i32.add
            local.set 0
            local.get 4
            i32.const 4
            i32.shr_u
            local.tee 4
            br_if 0 (;@4;)
          end
          local.get 0
          i32.const 128
          i32.add
          local.tee 4
          i32.const 129
          i32.ge_u
          br_if 2 (;@1;)
          local.get 1
          i32.const 1
          i32.const 1054572
          i32.const 2
          local.get 2
          local.get 0
          i32.add
          i32.const 128
          i32.add
          i32.const 0
          local.get 0
          i32.sub
          call $_ZN4core3fmt9Formatter12pad_integral17h56cb6b936c09c882E
          local.set 0
        end
        local.get 2
        i32.const 128
        i32.add
        global.set 0
        local.get 0
        return
      end
      local.get 4
      i32.const 128
      i32.const 1054556
      call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
      unreachable
    end
    local.get 4
    i32.const 128
    i32.const 1054556
    call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
    unreachable)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hb45251ab3c3bdb48E (type 2) (param i32) (result i64)
    i64.const -3452326882552253247)
  (func $_ZN60_$LT$core..cell..BorrowError$u20$as$u20$core..fmt..Debug$GT$3fmt17hcb497cdb5137530aE (type 3) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=24
    i32.const 1054260
    i32.const 11
    local.get 1
    i32.const 28
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 8))
  (func $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h4131a8147211fa76E (type 3) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=24
    i32.const 1054271
    i32.const 14
    local.get 1
    i32.const 28
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 8))
  (func $_ZN82_$LT$core..char..EscapeDebug$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h1b10a0b08a976a19E (type 5) (param i32) (result i32)
    (local i32 i32)
    i32.const 1114112
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load
            br_table 3 (;@1;) 2 (;@2;) 1 (;@3;) 0 (;@4;) 3 (;@1;)
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.const 12
                    i32.add
                    i32.load8_u
                    br_table 7 (;@1;) 4 (;@4;) 3 (;@5;) 2 (;@6;) 1 (;@7;) 0 (;@8;) 7 (;@1;)
                  end
                  local.get 0
                  i32.const 4
                  i32.store8 offset=12
                  i32.const 92
                  return
                end
                local.get 0
                i32.const 3
                i32.store8 offset=12
                i32.const 117
                return
              end
              local.get 0
              i32.const 2
              i32.store8 offset=12
              i32.const 123
              return
            end
            local.get 0
            i32.load offset=4
            local.get 0
            i32.const 8
            i32.add
            i32.load
            local.tee 2
            i32.const 2
            i32.shl
            i32.const 28
            i32.and
            i32.shr_u
            i32.const 15
            i32.and
            local.tee 1
            i32.const 48
            i32.or
            local.get 1
            i32.const 87
            i32.add
            local.get 1
            i32.const 10
            i32.lt_u
            select
            local.set 1
            block  ;; label = @5
              local.get 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              local.get 2
              i32.const -1
              i32.add
              i32.store offset=8
              local.get 1
              return
            end
            local.get 0
            i32.const 1
            i32.store8 offset=12
            local.get 1
            return
          end
          local.get 0
          i32.const 0
          i32.store8 offset=12
          i32.const 125
          return
        end
        local.get 0
        i32.const 1
        i32.store
        i32.const 92
        return
      end
      local.get 0
      i32.const 0
      i32.store
      local.get 0
      i32.load offset=4
      local.set 1
    end
    local.get 1)
  (func $_ZN4core3fmt8builders11DebugStruct5field17h6969da1bb0a508efE (type 12) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i64 i64)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 5
    global.set 0
    i32.const 1
    local.set 6
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load8_u offset=5
      local.set 7
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 8
        i32.load8_u
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=24
        i32.const 1054501
        i32.const 1054503
        local.get 7
        i32.const 255
        i32.and
        local.tee 7
        select
        i32.const 2
        i32.const 3
        local.get 7
        select
        local.get 8
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        br_if 1 (;@1;)
        i32.const 1
        local.set 6
        local.get 0
        i32.load
        local.tee 8
        i32.load offset=24
        local.get 1
        local.get 2
        local.get 8
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        br_if 1 (;@1;)
        i32.const 1
        local.set 6
        local.get 0
        i32.load
        local.tee 8
        i32.load offset=24
        i32.const 1054336
        i32.const 2
        local.get 8
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        br_if 1 (;@1;)
        local.get 3
        local.get 0
        i32.load
        local.get 4
        i32.load offset=12
        call_indirect (type 3)
        local.set 6
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 7
        i32.const 255
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=24
        i32.const 1054496
        i32.const 3
        local.get 8
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.set 8
      end
      i32.const 1
      local.set 6
      local.get 5
      i32.const 1
      i32.store8 offset=23
      local.get 5
      i32.const 52
      i32.add
      i32.const 1054468
      i32.store
      local.get 5
      local.get 8
      i64.load offset=24 align=4
      i64.store offset=8
      local.get 5
      local.get 5
      i32.const 23
      i32.add
      i32.store offset=16
      local.get 8
      i64.load offset=8 align=4
      local.set 9
      local.get 8
      i64.load offset=16 align=4
      local.set 10
      local.get 5
      local.get 8
      i32.load8_u offset=32
      i32.store8 offset=56
      local.get 5
      local.get 10
      i64.store offset=40
      local.get 5
      local.get 9
      i64.store offset=32
      local.get 5
      local.get 8
      i64.load align=4
      i64.store offset=24
      local.get 5
      local.get 5
      i32.const 8
      i32.add
      i32.store offset=48
      local.get 5
      i32.const 8
      i32.add
      local.get 1
      local.get 2
      call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h7d4360c25f7b0b1cE
      br_if 0 (;@1;)
      local.get 5
      i32.const 8
      i32.add
      i32.const 1054336
      i32.const 2
      call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h7d4360c25f7b0b1cE
      br_if 0 (;@1;)
      local.get 3
      local.get 5
      i32.const 24
      i32.add
      local.get 4
      i32.load offset=12
      call_indirect (type 3)
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=48
      i32.const 1054499
      i32.const 2
      local.get 5
      i32.load offset=52
      i32.load offset=12
      call_indirect (type 8)
      local.set 6
    end
    local.get 0
    i32.const 1
    i32.store8 offset=5
    local.get 0
    local.get 6
    i32.store8 offset=4
    local.get 5
    i32.const 64
    i32.add
    global.set 0
    local.get 0)
  (func $_ZN4core6option13expect_failed17hf689d8761c64e95fE (type 7) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.const 36
    i32.add
    i32.const 1
    i32.store
    local.get 3
    i64.const 1
    i64.store offset=20 align=4
    local.get 3
    i32.const 1054328
    i32.store offset=16
    local.get 3
    i32.const 79
    i32.store offset=44
    local.get 3
    local.get 3
    i32.const 40
    i32.add
    i32.store offset=32
    local.get 3
    local.get 3
    i32.const 8
    i32.add
    i32.store offset=40
    local.get 3
    i32.const 16
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h161ef327f1d4058dE
    unreachable)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h76450d0c1fa7b5b6E (type 3) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_ZN4core3fmt9Formatter3pad17h5d1a27371f812187E)
  (func $_ZN4core6option18expect_none_failed17h959c69efc793a13dE (type 10) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 5
    global.set 0
    local.get 5
    local.get 1
    i32.store offset=12
    local.get 5
    local.get 0
    i32.store offset=8
    local.get 5
    local.get 3
    i32.store offset=20
    local.get 5
    local.get 2
    i32.store offset=16
    local.get 5
    i32.const 44
    i32.add
    i32.const 2
    i32.store
    local.get 5
    i32.const 60
    i32.add
    i32.const 83
    i32.store
    local.get 5
    i64.const 2
    i64.store offset=28 align=4
    local.get 5
    i32.const 1054340
    i32.store offset=24
    local.get 5
    i32.const 79
    i32.store offset=52
    local.get 5
    local.get 5
    i32.const 48
    i32.add
    i32.store offset=40
    local.get 5
    local.get 5
    i32.const 16
    i32.add
    i32.store offset=56
    local.get 5
    local.get 5
    i32.const 8
    i32.add
    i32.store offset=48
    local.get 5
    i32.const 24
    i32.add
    local.get 4
    call $_ZN4core9panicking9panic_fmt17h161ef327f1d4058dE
    unreachable)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h37140add365c2157E (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 3))
  (func $_ZN4core5panic9PanicInfo7message17h173c452a45dbd3bdE (type 5) (param i32) (result i32)
    local.get 0
    i32.load offset=8)
  (func $_ZN4core5panic9PanicInfo8location17hd9842140c74e4b5aE (type 5) (param i32) (result i32)
    local.get 0
    i32.load offset=12)
  (func $_ZN4core5panic8Location6caller17hd41fba21c9b92f2bE (type 5) (param i32) (result i32)
    local.get 0)
  (func $_ZN4core5panic8Location4file17h51ec8de78a0a7533E (type 6) (param i32 i32)
    local.get 0
    local.get 1
    i64.load align=4
    i64.store align=4)
  (func $_ZN60_$LT$core..panic..Location$u20$as$u20$core..fmt..Display$GT$3fmt17h37d828db1f545440E (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 20
    i32.add
    i32.const 13
    i32.store
    local.get 2
    i32.const 12
    i32.add
    i32.const 13
    i32.store
    local.get 2
    i32.const 79
    i32.store offset=4
    local.get 2
    local.get 0
    i32.store
    local.get 2
    local.get 0
    i32.const 12
    i32.add
    i32.store offset=16
    local.get 2
    local.get 0
    i32.const 8
    i32.add
    i32.store offset=8
    local.get 1
    i32.const 28
    i32.add
    i32.load
    local.set 0
    local.get 1
    i32.load offset=24
    local.set 1
    local.get 2
    i32.const 24
    i32.add
    i32.const 20
    i32.add
    i32.const 3
    i32.store
    local.get 2
    i64.const 3
    i64.store offset=28 align=4
    local.get 2
    i32.const 1054376
    i32.store offset=24
    local.get 2
    local.get 2
    i32.store offset=40
    local.get 1
    local.get 0
    local.get 2
    i32.const 24
    i32.add
    call $_ZN4core3fmt5write17hf78275652148e08fE
    local.set 0
    local.get 2
    i32.const 48
    i32.add
    global.set 0
    local.get 0)
  (func $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h7d4360c25f7b0b1cE (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.const 40
      i32.add
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.load offset=8
                  i32.load8_u
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 0
                  i32.load
                  i32.const 1054492
                  i32.const 4
                  local.get 0
                  i32.load offset=4
                  i32.load offset=12
                  call_indirect (type 8)
                  br_if 5 (;@2;)
                end
                local.get 3
                i32.const 10
                i32.store offset=40
                local.get 3
                i64.const 4294967306
                i64.store offset=32
                local.get 3
                local.get 2
                i32.store offset=28
                local.get 3
                i32.const 0
                i32.store offset=24
                local.get 3
                local.get 2
                i32.store offset=20
                local.get 3
                local.get 1
                i32.store offset=16
                local.get 3
                i32.const 8
                i32.add
                i32.const 10
                local.get 1
                local.get 2
                call $_ZN4core5slice6memchr6memchr17h00efbe6d015a8522E
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 3
                        i32.load offset=8
                        i32.const 1
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 3
                        i32.load offset=12
                        local.set 4
                        loop  ;; label = @11
                          local.get 3
                          local.get 4
                          local.get 3
                          i32.load offset=24
                          i32.add
                          i32.const 1
                          i32.add
                          local.tee 4
                          i32.store offset=24
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 4
                              local.get 3
                              i32.load offset=36
                              local.tee 6
                              i32.ge_u
                              br_if 0 (;@13;)
                              local.get 3
                              i32.load offset=20
                              local.set 7
                              br 1 (;@12;)
                            end
                            local.get 3
                            i32.load offset=20
                            local.tee 7
                            local.get 4
                            i32.lt_u
                            br_if 0 (;@12;)
                            local.get 6
                            i32.const 5
                            i32.ge_u
                            br_if 7 (;@5;)
                            local.get 3
                            i32.load offset=16
                            local.get 4
                            local.get 6
                            i32.sub
                            local.tee 8
                            i32.add
                            local.tee 9
                            local.get 5
                            i32.eq
                            br_if 4 (;@8;)
                            local.get 9
                            local.get 5
                            local.get 6
                            call $memcmp
                            i32.eqz
                            br_if 4 (;@8;)
                          end
                          local.get 3
                          i32.load offset=28
                          local.tee 9
                          local.get 4
                          i32.lt_u
                          br_if 2 (;@9;)
                          local.get 7
                          local.get 9
                          i32.lt_u
                          br_if 2 (;@9;)
                          local.get 3
                          local.get 6
                          local.get 3
                          i32.const 16
                          i32.add
                          i32.add
                          i32.const 23
                          i32.add
                          i32.load8_u
                          local.get 3
                          i32.load offset=16
                          local.get 4
                          i32.add
                          local.get 9
                          local.get 4
                          i32.sub
                          call $_ZN4core5slice6memchr6memchr17h00efbe6d015a8522E
                          local.get 3
                          i32.load offset=4
                          local.set 4
                          local.get 3
                          i32.load
                          i32.const 1
                          i32.eq
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 3
                      local.get 3
                      i32.load offset=28
                      i32.store offset=24
                    end
                    local.get 0
                    i32.load offset=8
                    i32.const 0
                    i32.store8
                    local.get 2
                    local.set 4
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.load offset=8
                  i32.const 1
                  i32.store8
                  local.get 8
                  i32.const 1
                  i32.add
                  local.set 4
                end
                local.get 0
                i32.load offset=4
                local.set 9
                local.get 0
                i32.load
                local.set 6
                block  ;; label = @7
                  local.get 4
                  i32.eqz
                  local.get 2
                  local.get 4
                  i32.eq
                  i32.or
                  local.tee 7
                  br_if 0 (;@7;)
                  local.get 2
                  local.get 4
                  i32.le_u
                  br_if 3 (;@4;)
                  local.get 1
                  local.get 4
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.le_s
                  br_if 3 (;@4;)
                end
                local.get 6
                local.get 1
                local.get 4
                local.get 9
                i32.load offset=12
                call_indirect (type 8)
                br_if 4 (;@2;)
                block  ;; label = @7
                  local.get 7
                  br_if 0 (;@7;)
                  local.get 2
                  local.get 4
                  i32.le_u
                  br_if 4 (;@3;)
                  local.get 1
                  local.get 4
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.le_s
                  br_if 4 (;@3;)
                end
                local.get 1
                local.get 4
                i32.add
                local.set 1
                local.get 2
                local.get 4
                i32.sub
                local.tee 2
                br_if 0 (;@6;)
              end
              i32.const 0
              local.set 4
              br 4 (;@1;)
            end
            local.get 6
            i32.const 4
            i32.const 1055112
            call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
            unreachable
          end
          local.get 1
          local.get 2
          i32.const 0
          local.get 4
          i32.const 1055612
          call $_ZN4core3str16slice_error_fail17he0dcaa8f825738e6E
          unreachable
        end
        local.get 1
        local.get 2
        local.get 4
        local.get 2
        i32.const 1055628
        call $_ZN4core3str16slice_error_fail17he0dcaa8f825738e6E
        unreachable
      end
      i32.const 1
      local.set 4
    end
    local.get 3
    i32.const 48
    i32.add
    global.set 0
    local.get 4)
  (func $_ZN4core5slice6memchr6memchr17h00efbe6d015a8522E (type 4) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    i32.const 0
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 3
            i32.and
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            i32.const 4
            local.get 5
            i32.sub
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 5
            local.get 5
            local.get 3
            i32.gt_u
            select
            local.tee 6
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 5
            local.get 1
            i32.const 255
            i32.and
            local.set 4
            loop  ;; label = @5
              local.get 2
              local.get 5
              i32.add
              i32.load8_u
              local.get 4
              i32.eq
              br_if 2 (;@3;)
              local.get 6
              local.get 5
              i32.const 1
              i32.add
              local.tee 5
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 6
            local.set 4
          end
          local.get 3
          i32.const 8
          i32.lt_u
          br_if 1 (;@2;)
          local.get 4
          local.get 3
          i32.const -8
          i32.add
          local.tee 7
          i32.gt_u
          br_if 1 (;@2;)
          local.get 1
          i32.const 255
          i32.and
          i32.const 16843009
          i32.mul
          local.set 5
          block  ;; label = @4
            loop  ;; label = @5
              local.get 2
              local.get 4
              i32.add
              local.tee 6
              i32.const 4
              i32.add
              i32.load
              local.get 5
              i32.xor
              local.tee 8
              i32.const -1
              i32.xor
              local.get 8
              i32.const -16843009
              i32.add
              i32.and
              local.get 6
              i32.load
              local.get 5
              i32.xor
              local.tee 6
              i32.const -1
              i32.xor
              local.get 6
              i32.const -16843009
              i32.add
              i32.and
              i32.or
              i32.const -2139062144
              i32.and
              br_if 1 (;@4;)
              local.get 4
              i32.const 8
              i32.add
              local.tee 4
              local.get 7
              i32.le_u
              br_if 0 (;@5;)
            end
          end
          local.get 4
          local.get 3
          i32.le_u
          br_if 1 (;@2;)
          local.get 4
          local.get 3
          i32.const 1054884
          call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
          unreachable
        end
        i32.const 1
        local.set 6
        br 1 (;@1;)
      end
      i32.const 0
      local.set 5
      i32.const 0
      local.set 6
      block  ;; label = @2
        local.get 4
        local.get 3
        i32.eq
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        i32.add
        local.set 2
        local.get 3
        local.get 4
        i32.sub
        local.set 8
        i32.const 0
        local.set 5
        local.get 1
        i32.const 255
        i32.and
        local.set 6
        block  ;; label = @3
          loop  ;; label = @4
            local.get 2
            local.get 5
            i32.add
            i32.load8_u
            local.get 6
            i32.eq
            br_if 1 (;@3;)
            local.get 8
            local.get 5
            i32.const 1
            i32.add
            local.tee 5
            i32.ne
            br_if 0 (;@4;)
          end
          i32.const 0
          local.set 6
          local.get 8
          local.get 4
          i32.add
          local.set 5
          br 2 (;@1;)
        end
        i32.const 1
        local.set 6
        local.get 5
        local.set 5
      end
      local.get 5
      local.get 4
      i32.add
      local.set 5
    end
    local.get 0
    local.get 5
    i32.store offset=4
    local.get 0
    local.get 6
    i32.store)
  (func $_ZN4core3fmt8builders10DebugTuple5field17ha8d7daf60661e76bE (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i64 i64)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 3
    global.set 0
    i32.const 1
    local.set 4
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=8
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.set 5
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 6
        i32.load8_u
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 4
        local.get 6
        i32.load offset=24
        i32.const 1054501
        i32.const 1054511
        local.get 5
        select
        i32.const 2
        i32.const 1
        local.get 5
        select
        local.get 6
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        br_if 1 (;@1;)
        local.get 1
        local.get 0
        i32.load
        local.get 2
        i32.load offset=12
        call_indirect (type 3)
        local.set 4
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 5
        br_if 0 (;@2;)
        i32.const 1
        local.set 4
        local.get 6
        i32.load offset=24
        i32.const 1054509
        i32.const 2
        local.get 6
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.set 6
      end
      i32.const 1
      local.set 4
      local.get 3
      i32.const 1
      i32.store8 offset=23
      local.get 3
      i32.const 52
      i32.add
      i32.const 1054468
      i32.store
      local.get 3
      local.get 6
      i64.load offset=24 align=4
      i64.store offset=8
      local.get 3
      local.get 3
      i32.const 23
      i32.add
      i32.store offset=16
      local.get 6
      i64.load offset=8 align=4
      local.set 7
      local.get 6
      i64.load offset=16 align=4
      local.set 8
      local.get 3
      local.get 6
      i32.load8_u offset=32
      i32.store8 offset=56
      local.get 3
      local.get 8
      i64.store offset=40
      local.get 3
      local.get 7
      i64.store offset=32
      local.get 3
      local.get 6
      i64.load align=4
      i64.store offset=24
      local.get 3
      local.get 3
      i32.const 8
      i32.add
      i32.store offset=48
      local.get 1
      local.get 3
      i32.const 24
      i32.add
      local.get 2
      i32.load offset=12
      call_indirect (type 3)
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=48
      i32.const 1054499
      i32.const 2
      local.get 3
      i32.load offset=52
      i32.load offset=12
      call_indirect (type 8)
      local.set 4
    end
    local.get 0
    local.get 4
    i32.store8 offset=8
    local.get 0
    local.get 0
    i32.load offset=4
    i32.const 1
    i32.add
    i32.store offset=4
    local.get 3
    i32.const 64
    i32.add
    global.set 0
    local.get 0)
  (func $_ZN4core3fmt8builders10DebugTuple6finish17hf5054e572dd32ba2E (type 5) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    i32.load8_u offset=8
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const 255
      i32.and
      local.set 3
      i32.const 1
      local.set 1
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 2
          i32.const 1
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          i32.load8_u offset=9
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.load
          local.tee 3
          i32.load8_u
          i32.const 4
          i32.and
          br_if 0 (;@3;)
          i32.const 1
          local.set 1
          local.get 3
          i32.load offset=24
          i32.const 1054512
          i32.const 1
          local.get 3
          i32.const 28
          i32.add
          i32.load
          i32.load offset=12
          call_indirect (type 8)
          br_if 1 (;@2;)
        end
        local.get 0
        i32.load
        local.tee 1
        i32.load offset=24
        i32.const 1054513
        i32.const 1
        local.get 1
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        local.set 1
      end
      local.get 0
      local.get 1
      i32.store8 offset=8
    end
    local.get 1
    i32.const 255
    i32.and
    i32.const 0
    i32.ne)
  (func $_ZN4core3fmt8builders10DebugInner5entry17h51d95cb3aeb668bbE (type 7) (param i32 i32 i32)
    (local i32 i32 i32 i64 i64)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 3
    global.set 0
    i32.const 1
    local.set 4
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load8_u offset=5
      local.set 4
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 5
        i32.load8_u
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 4
          i32.const 255
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          i32.const 1
          local.set 4
          local.get 5
          i32.load offset=24
          i32.const 1054501
          i32.const 2
          local.get 5
          i32.const 28
          i32.add
          i32.load
          i32.load offset=12
          call_indirect (type 8)
          br_if 2 (;@1;)
          local.get 0
          i32.load
          local.set 5
        end
        local.get 1
        local.get 5
        local.get 2
        i32.load offset=12
        call_indirect (type 3)
        local.set 4
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        i32.const 255
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 4
        local.get 5
        i32.load offset=24
        i32.const 1054514
        i32.const 1
        local.get 5
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.set 5
      end
      i32.const 1
      local.set 4
      local.get 3
      i32.const 1
      i32.store8 offset=23
      local.get 3
      i32.const 52
      i32.add
      i32.const 1054468
      i32.store
      local.get 3
      local.get 5
      i64.load offset=24 align=4
      i64.store offset=8
      local.get 3
      local.get 3
      i32.const 23
      i32.add
      i32.store offset=16
      local.get 5
      i64.load offset=8 align=4
      local.set 6
      local.get 5
      i64.load offset=16 align=4
      local.set 7
      local.get 3
      local.get 5
      i32.load8_u offset=32
      i32.store8 offset=56
      local.get 3
      local.get 7
      i64.store offset=40
      local.get 3
      local.get 6
      i64.store offset=32
      local.get 3
      local.get 5
      i64.load align=4
      i64.store offset=24
      local.get 3
      local.get 3
      i32.const 8
      i32.add
      i32.store offset=48
      local.get 1
      local.get 3
      i32.const 24
      i32.add
      local.get 2
      i32.load offset=12
      call_indirect (type 3)
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=48
      i32.const 1054499
      i32.const 2
      local.get 3
      i32.load offset=52
      i32.load offset=12
      call_indirect (type 8)
      local.set 4
    end
    local.get 0
    i32.const 1
    i32.store8 offset=5
    local.get 0
    local.get 4
    i32.store8 offset=4
    local.get 3
    i32.const 64
    i32.add
    global.set 0)
  (func $_ZN4core3fmt8builders8DebugSet5entry17hcec6345aa501ef45E (type 8) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN4core3fmt8builders10DebugInner5entry17h51d95cb3aeb668bbE
    local.get 0)
  (func $_ZN4core3fmt8builders9DebugList6finish17hbd08192effc20d79E (type 5) (param i32) (result i32)
    (local i32)
    i32.const 1
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.tee 0
      i32.load offset=24
      i32.const 1054532
      i32.const 1
      local.get 0
      i32.const 28
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 8)
      local.set 1
    end
    local.get 1)
  (func $_ZN4core3fmt5Write10write_char17h9446e22d80409ee0E (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 2
            i32.const 12
            i32.add
            local.set 3
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          local.get 2
          i32.const 12
          i32.add
          local.set 3
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        local.get 2
        i32.const 12
        i32.add
        local.set 3
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 240
      i32.or
      i32.store8 offset=12
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      i32.const 4
      local.set 1
    end
    local.get 0
    local.get 3
    local.get 1
    call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h7d4360c25f7b0b1cE
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN4core3fmt5Write9write_fmt17h6f04c3f5d7115a7dE (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 4
    i32.add
    i32.const 1054776
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17hf78275652148e08fE
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17hb3f289137b2fd88fE (type 8) (param i32 i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 2
    call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h7d4360c25f7b0b1cE)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h96c3b1b942e129b3E (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.load
    local.set 0
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 2
            i32.const 12
            i32.add
            local.set 3
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          local.get 2
          i32.const 12
          i32.add
          local.set 3
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        local.get 2
        i32.const 12
        i32.add
        local.set 3
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 240
      i32.or
      i32.store8 offset=12
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      i32.const 4
      local.set 1
    end
    local.get 0
    local.get 3
    local.get 1
    call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h7d4360c25f7b0b1cE
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hcaddaae78279c2cdE (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.load
    i32.store offset=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 4
    i32.add
    i32.const 1054776
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17hf78275652148e08fE
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h74a61b11f6dc7b9dE (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 1
    i32.const 28
    i32.add
    i32.load
    local.set 3
    local.get 1
    i32.load offset=24
    local.set 1
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 0
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 0
    i64.load align=4
    i64.store offset=8
    local.get 1
    local.get 3
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17hf78275652148e08fE
    local.set 0
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 0)
  (func $_ZN4core3fmt9Formatter12pad_integral17h56cb6b936c09c882E (type 13) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        i32.const 43
        i32.const 1114112
        local.get 0
        i32.load
        local.tee 6
        i32.const 1
        i32.and
        local.tee 1
        select
        local.set 7
        local.get 1
        local.get 5
        i32.add
        local.set 8
        br 1 (;@1;)
      end
      local.get 5
      i32.const 1
      i32.add
      local.set 8
      local.get 0
      i32.load
      local.set 6
      i32.const 45
      local.set 7
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      i32.const 0
      local.set 9
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.set 10
        local.get 2
        local.set 1
        loop  ;; label = @3
          local.get 9
          local.get 1
          i32.load8_u
          i32.const 192
          i32.and
          i32.const 128
          i32.eq
          i32.add
          local.set 9
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 10
          i32.const -1
          i32.add
          local.tee 10
          br_if 0 (;@3;)
        end
      end
      local.get 8
      local.get 3
      i32.add
      local.get 9
      i32.sub
      local.set 8
    end
    i32.const 1
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        i32.const 1
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        local.get 7
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17habdb77b387a9ff26E
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=24
        local.get 4
        local.get 5
        local.get 0
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        local.set 1
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        i32.const 12
        i32.add
        i32.load
        local.tee 9
        local.get 8
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 7
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17habdb77b387a9ff26E
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=24
        local.get 4
        local.get 5
        local.get 0
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 6
          i32.const 8
          i32.and
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          local.get 9
          local.get 8
          i32.sub
          local.tee 9
          local.set 8
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 1
                local.get 0
                i32.load8_u offset=32
                local.tee 10
                local.get 10
                i32.const 3
                i32.eq
                select
                br_table 2 (;@4;) 1 (;@5;) 0 (;@6;) 1 (;@5;) 2 (;@4;)
              end
              local.get 9
              i32.const 1
              i32.shr_u
              local.set 1
              local.get 9
              i32.const 1
              i32.add
              i32.const 1
              i32.shr_u
              local.set 8
              br 1 (;@4;)
            end
            i32.const 0
            local.set 8
            local.get 9
            local.set 1
          end
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          loop  ;; label = @4
            local.get 1
            i32.const -1
            i32.add
            local.tee 1
            i32.eqz
            br_if 2 (;@2;)
            local.get 0
            i32.load offset=24
            local.get 0
            i32.load offset=4
            local.get 0
            i32.load offset=28
            i32.load offset=16
            call_indirect (type 3)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        local.get 0
        i32.load offset=4
        local.set 6
        local.get 0
        i32.const 48
        i32.store offset=4
        local.get 0
        i32.load8_u offset=32
        local.set 11
        i32.const 1
        local.set 1
        local.get 0
        i32.const 1
        i32.store8 offset=32
        local.get 0
        local.get 7
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17habdb77b387a9ff26E
        br_if 1 (;@1;)
        i32.const 0
        local.set 1
        local.get 9
        local.get 8
        i32.sub
        local.tee 10
        local.set 3
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 1
              local.get 0
              i32.load8_u offset=32
              local.tee 9
              local.get 9
              i32.const 3
              i32.eq
              select
              br_table 2 (;@3;) 1 (;@4;) 0 (;@5;) 1 (;@4;) 2 (;@3;)
            end
            local.get 10
            i32.const 1
            i32.shr_u
            local.set 1
            local.get 10
            i32.const 1
            i32.add
            i32.const 1
            i32.shr_u
            local.set 3
            br 1 (;@3;)
          end
          i32.const 0
          local.set 3
          local.get 10
          local.set 1
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            i32.const -1
            i32.add
            local.tee 1
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            i32.load offset=24
            local.get 0
            i32.load offset=4
            local.get 0
            i32.load offset=28
            i32.load offset=16
            call_indirect (type 3)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        local.get 0
        i32.load offset=4
        local.set 10
        i32.const 1
        local.set 1
        local.get 0
        i32.load offset=24
        local.get 4
        local.get 5
        local.get 0
        i32.load offset=28
        i32.load offset=12
        call_indirect (type 8)
        br_if 1 (;@1;)
        local.get 3
        i32.const 1
        i32.add
        local.set 9
        local.get 0
        i32.load offset=28
        local.set 3
        local.get 0
        i32.load offset=24
        local.set 2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 9
            i32.const -1
            i32.add
            local.tee 9
            i32.eqz
            br_if 1 (;@3;)
            i32.const 1
            local.set 1
            local.get 2
            local.get 10
            local.get 3
            i32.load offset=16
            call_indirect (type 3)
            br_if 3 (;@1;)
            br 0 (;@4;)
          end
        end
        local.get 0
        local.get 11
        i32.store8 offset=32
        local.get 0
        local.get 6
        i32.store offset=4
        i32.const 0
        return
      end
      local.get 0
      i32.load offset=4
      local.set 10
      i32.const 1
      local.set 1
      local.get 0
      local.get 7
      local.get 2
      local.get 3
      call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17habdb77b387a9ff26E
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=24
      local.get 4
      local.get 5
      local.get 0
      i32.load offset=28
      i32.load offset=12
      call_indirect (type 8)
      br_if 0 (;@1;)
      local.get 8
      i32.const 1
      i32.add
      local.set 9
      local.get 0
      i32.load offset=28
      local.set 3
      local.get 0
      i32.load offset=24
      local.set 0
      loop  ;; label = @2
        block  ;; label = @3
          local.get 9
          i32.const -1
          i32.add
          local.tee 9
          br_if 0 (;@3;)
          i32.const 0
          return
        end
        i32.const 1
        local.set 1
        local.get 0
        local.get 10
        local.get 3
        i32.load offset=16
        call_indirect (type 3)
        i32.eqz
        br_if 0 (;@2;)
      end
    end
    local.get 1)
  (func $_ZN4core3fmt9Formatter12pad_integral12write_prefix17habdb77b387a9ff26E (type 9) (param i32 i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 1114112
        i32.eq
        br_if 0 (;@2;)
        i32.const 1
        local.set 4
        local.get 0
        i32.load offset=24
        local.get 1
        local.get 0
        i32.const 28
        i32.add
        i32.load
        i32.load offset=16
        call_indirect (type 3)
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 0
      i32.load offset=24
      local.get 2
      local.get 3
      local.get 0
      i32.const 28
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 8)
      local.set 4
    end
    local.get 4)
  (func $_ZN4core3fmt9Formatter9write_str17h545f61f492283d6dE (type 8) (param i32 i32 i32) (result i32)
    local.get 0
    i32.load offset=24
    local.get 1
    local.get 2
    local.get 0
    i32.const 28
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 8))
  (func $_ZN4core3fmt9Formatter9write_fmt17hdee63efa69c306f6E (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.const 28
    i32.add
    i32.load
    local.set 3
    local.get 0
    i32.load offset=24
    local.set 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 0
    local.get 3
    local.get 2
    i32.const 8
    i32.add
    call $_ZN4core3fmt5write17hf78275652148e08fE
    local.set 1
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN4core3fmt9Formatter15debug_lower_hex17hce81659868cce5baE (type 5) (param i32) (result i32)
    local.get 0
    i32.load8_u
    i32.const 16
    i32.and
    i32.const 4
    i32.shr_u)
  (func $_ZN4core3fmt9Formatter15debug_upper_hex17h19a78e2dfbd00c52E (type 5) (param i32) (result i32)
    local.get 0
    i32.load8_u
    i32.const 32
    i32.and
    i32.const 5
    i32.shr_u)
  (func $_ZN4core3fmt9Formatter11debug_tuple17hafbe9eaebee7e85bE (type 4) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.load offset=24
    local.get 2
    local.get 3
    local.get 1
    i32.const 28
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 8)
    i32.store8 offset=8
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 3
    i32.eqz
    i32.store8 offset=9
    local.get 0
    i32.const 0
    i32.store offset=4)
  (func $_ZN4core3fmt9Formatter10debug_list17haf359c45ea555102E (type 6) (param i32 i32)
    (local i32)
    local.get 1
    i32.load offset=24
    i32.const 1054515
    i32.const 1
    local.get 1
    i32.const 28
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 8)
    local.set 2
    local.get 0
    i32.const 0
    i32.store8 offset=5
    local.get 0
    local.get 2
    i32.store8 offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN57_$LT$core..fmt..Formatter$u20$as$u20$core..fmt..Write$GT$10write_char17h10ad0684667415e1E (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=24
    local.get 1
    local.get 0
    i32.const 28
    i32.add
    i32.load
    i32.load offset=16
    call_indirect (type 3))
  (func $_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h7843956b8f6f7061E (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    i32.const 1
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=24
        i32.const 34
        local.get 2
        i32.const 28
        i32.add
        i32.load
        i32.load offset=16
        call_indirect (type 3)
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            br_if 0 (;@4;)
            i32.const 0
            local.set 5
            br 1 (;@3;)
          end
          local.get 0
          local.get 1
          i32.add
          local.set 6
          i32.const 0
          local.set 5
          local.get 0
          local.set 7
          i32.const 0
          local.set 8
          block  ;; label = @4
            loop  ;; label = @5
              local.get 7
              local.set 9
              local.get 7
              i32.const 1
              i32.add
              local.set 10
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 7
                    i32.load8_s
                    local.tee 11
                    i32.const -1
                    i32.gt_s
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 10
                        local.get 6
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 12
                        local.get 6
                        local.set 7
                        br 1 (;@9;)
                      end
                      local.get 7
                      i32.load8_u offset=1
                      i32.const 63
                      i32.and
                      local.set 12
                      local.get 7
                      i32.const 2
                      i32.add
                      local.tee 10
                      local.set 7
                    end
                    local.get 11
                    i32.const 31
                    i32.and
                    local.set 4
                    block  ;; label = @9
                      local.get 11
                      i32.const 255
                      i32.and
                      local.tee 11
                      i32.const 223
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 12
                      local.get 4
                      i32.const 6
                      i32.shl
                      i32.or
                      local.set 12
                      br 2 (;@7;)
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 7
                        local.get 6
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 13
                        local.get 6
                        local.set 14
                        br 1 (;@9;)
                      end
                      local.get 7
                      i32.load8_u
                      i32.const 63
                      i32.and
                      local.set 13
                      local.get 7
                      i32.const 1
                      i32.add
                      local.tee 10
                      local.set 14
                    end
                    local.get 13
                    local.get 12
                    i32.const 6
                    i32.shl
                    i32.or
                    local.set 12
                    block  ;; label = @9
                      local.get 11
                      i32.const 240
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 12
                      local.get 4
                      i32.const 12
                      i32.shl
                      i32.or
                      local.set 12
                      br 2 (;@7;)
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 14
                        local.get 6
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 11
                        local.get 10
                        local.set 7
                        br 1 (;@9;)
                      end
                      local.get 14
                      i32.const 1
                      i32.add
                      local.set 7
                      local.get 14
                      i32.load8_u
                      i32.const 63
                      i32.and
                      local.set 11
                    end
                    local.get 12
                    i32.const 6
                    i32.shl
                    local.get 4
                    i32.const 18
                    i32.shl
                    i32.const 1835008
                    i32.and
                    i32.or
                    local.get 11
                    i32.or
                    local.tee 12
                    i32.const 1114112
                    i32.ne
                    br_if 2 (;@6;)
                    br 4 (;@4;)
                  end
                  local.get 11
                  i32.const 255
                  i32.and
                  local.set 12
                end
                local.get 10
                local.set 7
              end
              i32.const 2
              local.set 10
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 12
                          i32.const -9
                          i32.add
                          local.tee 11
                          i32.const 30
                          i32.le_u
                          br_if 0 (;@11;)
                          local.get 12
                          i32.const 92
                          i32.ne
                          br_if 1 (;@10;)
                          br 2 (;@9;)
                        end
                        i32.const 116
                        local.set 14
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 11
                            br_table 5 (;@7;) 1 (;@11;) 2 (;@10;) 2 (;@10;) 0 (;@12;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 3 (;@9;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 2 (;@10;) 3 (;@9;) 5 (;@7;)
                          end
                          i32.const 114
                          local.set 14
                          br 4 (;@7;)
                        end
                        i32.const 110
                        local.set 14
                        br 3 (;@7;)
                      end
                      block  ;; label = @10
                        local.get 12
                        call $_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4933ac236810a5b5E
                        br_if 0 (;@10;)
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 12
                            i32.const 65536
                            i32.lt_u
                            br_if 0 (;@12;)
                            local.get 12
                            i32.const 131072
                            i32.lt_u
                            br_if 1 (;@11;)
                            local.get 12
                            i32.const -918000
                            i32.add
                            i32.const 196112
                            i32.lt_u
                            br_if 2 (;@10;)
                            local.get 12
                            i32.const -201547
                            i32.add
                            i32.const 716213
                            i32.lt_u
                            br_if 2 (;@10;)
                            local.get 12
                            i32.const -195102
                            i32.add
                            i32.const 1506
                            i32.lt_u
                            br_if 2 (;@10;)
                            local.get 12
                            i32.const -191457
                            i32.add
                            i32.const 3103
                            i32.lt_u
                            br_if 2 (;@10;)
                            local.get 12
                            i32.const -183970
                            i32.add
                            i32.const 14
                            i32.lt_u
                            br_if 2 (;@10;)
                            local.get 12
                            i32.const 2097150
                            i32.and
                            i32.const 178206
                            i32.eq
                            br_if 2 (;@10;)
                            local.get 12
                            i32.const -173790
                            i32.add
                            i32.const 34
                            i32.lt_u
                            br_if 2 (;@10;)
                            local.get 12
                            i32.const -177973
                            i32.add
                            i32.const 10
                            i32.le_u
                            br_if 2 (;@10;)
                            br 6 (;@6;)
                          end
                          local.get 12
                          i32.const 1055932
                          i32.const 41
                          i32.const 1056014
                          i32.const 290
                          i32.const 1056304
                          i32.const 309
                          call $_ZN4core7unicode9printable5check17h2e35b7ca08ef1a57E
                          i32.eqz
                          br_if 1 (;@10;)
                          br 5 (;@6;)
                        end
                        local.get 12
                        i32.const 1056613
                        i32.const 38
                        i32.const 1056689
                        i32.const 175
                        i32.const 1056864
                        i32.const 419
                        call $_ZN4core7unicode9printable5check17h2e35b7ca08ef1a57E
                        br_if 4 (;@6;)
                      end
                      local.get 12
                      i32.const 1
                      i32.or
                      i32.clz
                      i32.const 2
                      i32.shr_u
                      i32.const 7
                      i32.xor
                      i64.extend_i32_u
                      i64.const 21474836480
                      i64.or
                      local.set 15
                      i32.const 3
                      local.set 10
                      br 1 (;@8;)
                    end
                  end
                  local.get 12
                  local.set 14
                end
                local.get 3
                local.get 1
                i32.store offset=4
                local.get 3
                local.get 0
                i32.store
                local.get 3
                local.get 5
                i32.store offset=8
                local.get 3
                local.get 8
                i32.store offset=12
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 8
                    local.get 5
                    i32.lt_u
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      local.get 5
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      local.get 1
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 5
                      local.get 1
                      i32.ge_u
                      br_if 1 (;@8;)
                      local.get 0
                      local.get 5
                      i32.add
                      i32.load8_s
                      i32.const -65
                      i32.le_s
                      br_if 1 (;@8;)
                    end
                    block  ;; label = @9
                      local.get 8
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 8
                      local.get 1
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 8
                      local.get 1
                      i32.ge_u
                      br_if 1 (;@8;)
                      local.get 0
                      local.get 8
                      i32.add
                      i32.load8_s
                      i32.const -65
                      i32.le_s
                      br_if 1 (;@8;)
                    end
                    local.get 2
                    i32.load offset=24
                    local.get 0
                    local.get 5
                    i32.add
                    local.get 8
                    local.get 5
                    i32.sub
                    local.get 2
                    i32.load offset=28
                    i32.load offset=12
                    call_indirect (type 8)
                    i32.eqz
                    br_if 1 (;@7;)
                    i32.const 1
                    local.set 4
                    br 6 (;@2;)
                  end
                  local.get 3
                  local.get 3
                  i32.const 12
                  i32.add
                  i32.store offset=24
                  local.get 3
                  local.get 3
                  i32.const 8
                  i32.add
                  i32.store offset=20
                  local.get 3
                  local.get 3
                  i32.store offset=16
                  local.get 3
                  i32.const 16
                  i32.add
                  call $_ZN4core3str6traits101_$LT$impl$u20$core..slice..SliceIndex$LT$str$GT$$u20$for$u20$core..ops..range..Range$LT$usize$GT$$GT$5index28_$u7b$$u7b$closure$u7d$$u7d$17hff5efd4ea80ffcf2E
                  unreachable
                end
                loop  ;; label = @7
                  local.get 10
                  local.set 11
                  i32.const 1
                  local.set 4
                  i32.const 92
                  local.set 5
                  i32.const 1
                  local.set 10
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 11
                              br_table 2 (;@11;) 1 (;@12;) 5 (;@8;) 0 (;@13;) 2 (;@11;)
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 15
                                    i64.const 32
                                    i64.shr_u
                                    i32.wrap_i64
                                    i32.const 255
                                    i32.and
                                    br_table 5 (;@11;) 3 (;@13;) 2 (;@14;) 1 (;@15;) 0 (;@16;) 6 (;@10;) 5 (;@11;)
                                  end
                                  local.get 15
                                  i64.const -1095216660481
                                  i64.and
                                  i64.const 12884901888
                                  i64.or
                                  local.set 15
                                  i32.const 3
                                  local.set 10
                                  i32.const 117
                                  local.set 5
                                  br 7 (;@8;)
                                end
                                local.get 15
                                i64.const -1095216660481
                                i64.and
                                i64.const 8589934592
                                i64.or
                                local.set 15
                                i32.const 3
                                local.set 10
                                i32.const 123
                                local.set 5
                                br 6 (;@8;)
                              end
                              local.get 14
                              local.get 15
                              i32.wrap_i64
                              local.tee 11
                              i32.const 2
                              i32.shl
                              i32.const 28
                              i32.and
                              i32.shr_u
                              i32.const 15
                              i32.and
                              local.tee 10
                              i32.const 48
                              i32.or
                              local.get 10
                              i32.const 87
                              i32.add
                              local.get 10
                              i32.const 10
                              i32.lt_u
                              select
                              local.set 5
                              block  ;; label = @14
                                local.get 11
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 15
                                i64.const -1
                                i64.add
                                i64.const 4294967295
                                i64.and
                                local.get 15
                                i64.const -4294967296
                                i64.and
                                i64.or
                                local.set 15
                                br 5 (;@9;)
                              end
                              local.get 15
                              i64.const -1095216660481
                              i64.and
                              i64.const 4294967296
                              i64.or
                              local.set 15
                              br 4 (;@9;)
                            end
                            local.get 15
                            i64.const -1095216660481
                            i64.and
                            local.set 15
                            i32.const 3
                            local.set 10
                            i32.const 125
                            local.set 5
                            br 4 (;@8;)
                          end
                          i32.const 0
                          local.set 10
                          local.get 14
                          local.set 5
                          br 3 (;@8;)
                        end
                        i32.const 1
                        local.set 10
                        block  ;; label = @11
                          local.get 12
                          i32.const 128
                          i32.lt_u
                          br_if 0 (;@11;)
                          i32.const 2
                          local.set 10
                          local.get 12
                          i32.const 2048
                          i32.lt_u
                          br_if 0 (;@11;)
                          i32.const 3
                          i32.const 4
                          local.get 12
                          i32.const 65536
                          i32.lt_u
                          select
                          local.set 10
                        end
                        local.get 10
                        local.get 8
                        i32.add
                        local.set 5
                        br 4 (;@6;)
                      end
                      local.get 15
                      i64.const -1095216660481
                      i64.and
                      i64.const 17179869184
                      i64.or
                      local.set 15
                    end
                    i32.const 3
                    local.set 10
                  end
                  local.get 2
                  i32.load offset=24
                  local.get 5
                  local.get 2
                  i32.load offset=28
                  i32.load offset=16
                  call_indirect (type 3)
                  i32.eqz
                  br_if 0 (;@7;)
                  br 5 (;@2;)
                end
              end
              local.get 8
              local.get 9
              i32.sub
              local.get 7
              i32.add
              local.set 8
              local.get 6
              local.get 7
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 1
          i32.eq
          br_if 0 (;@3;)
          local.get 5
          local.get 1
          i32.ge_u
          br_if 2 (;@1;)
          local.get 0
          local.get 5
          i32.add
          i32.load8_s
          i32.const -65
          i32.le_s
          br_if 2 (;@1;)
        end
        i32.const 1
        local.set 4
        local.get 2
        i32.load offset=24
        local.get 0
        local.get 5
        i32.add
        local.get 1
        local.get 5
        i32.sub
        local.get 2
        i32.load offset=28
        i32.load offset=12
        call_indirect (type 8)
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=24
        i32.const 34
        local.get 2
        i32.load offset=28
        i32.load offset=16
        call_indirect (type 3)
        local.set 4
      end
      local.get 3
      i32.const 32
      i32.add
      global.set 0
      local.get 4
      return
    end
    local.get 0
    local.get 1
    local.get 5
    local.get 1
    i32.const 1055628
    call $_ZN4core3str16slice_error_fail17he0dcaa8f825738e6E
    unreachable)
  (func $_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4933ac236810a5b5E (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.const 15
          local.get 0
          i32.const 68900
          i32.lt_u
          select
          local.tee 1
          local.get 1
          i32.const 8
          i32.add
          local.tee 1
          local.get 1
          i32.const 2
          i32.shl
          i32.const 1057440
          i32.add
          i32.load
          i32.const 11
          i32.shl
          local.get 0
          i32.const 11
          i32.shl
          local.tee 1
          i32.gt_u
          select
          local.tee 2
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          local.get 2
          i32.const 2
          i32.shl
          i32.const 1057440
          i32.add
          i32.load
          i32.const 11
          i32.shl
          local.get 1
          i32.gt_u
          select
          local.tee 2
          local.get 2
          i32.const 2
          i32.add
          local.tee 2
          local.get 2
          i32.const 2
          i32.shl
          i32.const 1057440
          i32.add
          i32.load
          i32.const 11
          i32.shl
          local.get 1
          i32.gt_u
          select
          local.tee 2
          local.get 2
          i32.const 1
          i32.add
          local.tee 2
          local.get 2
          i32.const 2
          i32.shl
          i32.const 1057440
          i32.add
          i32.load
          i32.const 11
          i32.shl
          local.get 1
          i32.gt_u
          select
          local.tee 2
          i32.const 2
          i32.shl
          i32.const 1057440
          i32.add
          i32.load
          i32.const 11
          i32.shl
          local.tee 3
          local.get 1
          i32.eq
          local.get 3
          local.get 1
          i32.lt_u
          i32.add
          local.get 2
          i32.add
          local.tee 1
          i32.const 30
          i32.gt_u
          br_if 0 (;@3;)
          i32.const 689
          local.set 3
          block  ;; label = @4
            local.get 1
            i32.const 30
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            i32.const 2
            i32.shl
            i32.const 1057444
            i32.add
            i32.load
            i32.const 21
            i32.shr_u
            local.set 3
          end
          i32.const 0
          local.set 2
          block  ;; label = @4
            local.get 1
            i32.const -1
            i32.add
            local.tee 4
            local.get 1
            i32.gt_u
            br_if 0 (;@4;)
            local.get 4
            i32.const 31
            i32.ge_u
            br_if 3 (;@1;)
            local.get 4
            i32.const 2
            i32.shl
            i32.const 1057440
            i32.add
            i32.load
            i32.const 2097151
            i32.and
            local.set 2
          end
          block  ;; label = @4
            local.get 3
            local.get 1
            i32.const 2
            i32.shl
            i32.const 1057440
            i32.add
            i32.load
            i32.const 21
            i32.shr_u
            local.tee 1
            i32.const 1
            i32.add
            i32.eq
            br_if 0 (;@4;)
            local.get 0
            local.get 2
            i32.sub
            local.set 2
            local.get 3
            i32.const -1
            i32.add
            local.set 3
            i32.const 0
            local.set 0
            loop  ;; label = @5
              local.get 1
              i32.const 688
              i32.gt_u
              br_if 3 (;@2;)
              local.get 0
              local.get 1
              i32.const 1057564
              i32.add
              i32.load8_u
              i32.add
              local.tee 0
              local.get 2
              i32.gt_u
              br_if 1 (;@4;)
              local.get 3
              local.get 1
              i32.const 1
              i32.add
              local.tee 1
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 3
            local.set 1
          end
          local.get 1
          i32.const 1
          i32.and
          return
        end
        local.get 1
        i32.const 31
        i32.const 1057320
        call $_ZN4core9panicking18panic_bounds_check17h66b04f407ccd9a1eE
        unreachable
      end
      local.get 1
      i32.const 689
      i32.const 1057336
      call $_ZN4core9panicking18panic_bounds_check17h66b04f407ccd9a1eE
      unreachable
    end
    local.get 4
    i32.const 31
    i32.const 1057352
    call $_ZN4core9panicking18panic_bounds_check17h66b04f407ccd9a1eE
    unreachable)
  (func $_ZN4core7unicode9printable5check17h2e35b7ca08ef1a57E (type 14) (param i32 i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    i32.const 1
    local.set 7
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.const 1
        i32.shl
        i32.add
        local.set 8
        local.get 0
        i32.const 65280
        i32.and
        i32.const 8
        i32.shr_u
        local.set 9
        i32.const 0
        local.set 10
        local.get 0
        i32.const 255
        i32.and
        local.set 11
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            i32.const 2
            i32.add
            local.set 12
            local.get 10
            local.get 1
            i32.load8_u offset=1
            local.tee 2
            i32.add
            local.set 13
            block  ;; label = @5
              local.get 1
              i32.load8_u
              local.tee 1
              local.get 9
              i32.eq
              br_if 0 (;@5;)
              local.get 1
              local.get 9
              i32.gt_u
              br_if 3 (;@2;)
              local.get 13
              local.set 10
              local.get 12
              local.set 1
              local.get 12
              local.get 8
              i32.ne
              br_if 1 (;@4;)
              br 3 (;@2;)
            end
            block  ;; label = @5
              local.get 13
              local.get 10
              i32.lt_u
              br_if 0 (;@5;)
              local.get 13
              local.get 4
              i32.gt_u
              br_if 2 (;@3;)
              local.get 3
              local.get 10
              i32.add
              local.set 1
              block  ;; label = @6
                loop  ;; label = @7
                  local.get 2
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 2
                  i32.const -1
                  i32.add
                  local.set 2
                  local.get 1
                  i32.load8_u
                  local.set 10
                  local.get 1
                  i32.const 1
                  i32.add
                  local.set 1
                  local.get 10
                  local.get 11
                  i32.ne
                  br_if 0 (;@7;)
                end
                i32.const 0
                local.set 7
                br 5 (;@1;)
              end
              local.get 13
              local.set 10
              local.get 12
              local.set 1
              local.get 12
              local.get 8
              i32.ne
              br_if 1 (;@4;)
              br 3 (;@2;)
            end
          end
          local.get 10
          local.get 13
          i32.const 1055900
          call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
          unreachable
        end
        local.get 13
        local.get 4
        i32.const 1055900
        call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
        unreachable
      end
      local.get 6
      i32.eqz
      br_if 0 (;@1;)
      local.get 5
      local.get 6
      i32.add
      local.set 11
      local.get 0
      i32.const 65535
      i32.and
      local.set 1
      i32.const 1
      local.set 7
      block  ;; label = @2
        loop  ;; label = @3
          local.get 5
          i32.const 1
          i32.add
          local.set 10
          block  ;; label = @4
            block  ;; label = @5
              local.get 5
              i32.load8_u
              local.tee 2
              i32.const 24
              i32.shl
              i32.const 24
              i32.shr_s
              local.tee 13
              i32.const 0
              i32.lt_s
              br_if 0 (;@5;)
              local.get 10
              local.set 5
              br 1 (;@4;)
            end
            local.get 10
            local.get 11
            i32.eq
            br_if 2 (;@2;)
            local.get 13
            i32.const 127
            i32.and
            i32.const 8
            i32.shl
            local.get 5
            i32.load8_u offset=1
            i32.or
            local.set 2
            local.get 5
            i32.const 2
            i32.add
            local.set 5
          end
          local.get 1
          local.get 2
          i32.sub
          local.tee 1
          i32.const 0
          i32.lt_s
          br_if 2 (;@1;)
          local.get 7
          i32.const 1
          i32.xor
          local.set 7
          local.get 5
          local.get 11
          i32.ne
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      i32.const 1054285
      i32.const 43
      i32.const 1055916
      call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
      unreachable
    end
    local.get 7
    i32.const 1
    i32.and)
  (func $_ZN4core3str6traits101_$LT$impl$u20$core..slice..SliceIndex$LT$str$GT$$u20$for$u20$core..ops..range..Range$LT$usize$GT$$GT$5index28_$u7b$$u7b$closure$u7d$$u7d$17hff5efd4ea80ffcf2E (type 1) (param i32)
    (local i32)
    local.get 0
    i32.load
    local.tee 1
    i32.load
    local.get 1
    i32.load offset=4
    local.get 0
    i32.load offset=4
    i32.load
    local.get 0
    i32.load offset=8
    i32.load
    i32.const 1055596
    call $_ZN4core3str16slice_error_fail17he0dcaa8f825738e6E
    unreachable)
  (func $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h0d142c565b9fed95E (type 8) (param i32 i32 i32) (result i32)
    local.get 2
    local.get 0
    local.get 1
    call $_ZN4core3fmt9Formatter3pad17h5d1a27371f812187E)
  (func $_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h3e5fc21d5d0a9a89E (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i64)
    i32.const 1
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.load offset=24
      i32.const 39
      local.get 1
      i32.const 28
      i32.add
      i32.load
      i32.load offset=16
      call_indirect (type 3)
      br_if 0 (;@1;)
      i32.const 2
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load
                local.tee 0
                i32.const -9
                i32.add
                local.tee 4
                i32.const 30
                i32.le_u
                br_if 0 (;@6;)
                local.get 0
                i32.const 92
                i32.ne
                br_if 1 (;@5;)
                br 2 (;@4;)
              end
              i32.const 116
              local.set 5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  br_table 5 (;@2;) 1 (;@6;) 2 (;@5;) 2 (;@5;) 0 (;@7;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 3 (;@4;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 3 (;@4;) 5 (;@2;)
                end
                i32.const 114
                local.set 5
                br 4 (;@2;)
              end
              i32.const 110
              local.set 5
              br 3 (;@2;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  call $_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4933ac236810a5b5E
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        i32.const 65536
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 131072
                        i32.lt_u
                        br_if 1 (;@9;)
                        local.get 0
                        i32.const -918000
                        i32.add
                        i32.const 196112
                        i32.lt_u
                        br_if 2 (;@8;)
                        local.get 0
                        i32.const -201547
                        i32.add
                        i32.const 716213
                        i32.lt_u
                        br_if 2 (;@8;)
                        local.get 0
                        i32.const -195102
                        i32.add
                        i32.const 1506
                        i32.lt_u
                        br_if 2 (;@8;)
                        local.get 0
                        i32.const -191457
                        i32.add
                        i32.const 3103
                        i32.lt_u
                        br_if 2 (;@8;)
                        local.get 0
                        i32.const -183970
                        i32.add
                        i32.const 14
                        i32.lt_u
                        br_if 2 (;@8;)
                        local.get 0
                        i32.const 2097150
                        i32.and
                        i32.const 178206
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 0
                        i32.const -173790
                        i32.add
                        i32.const 34
                        i32.lt_u
                        br_if 2 (;@8;)
                        local.get 0
                        i32.const -177973
                        i32.add
                        i32.const 10
                        i32.gt_u
                        br_if 5 (;@5;)
                        br 2 (;@8;)
                      end
                      local.get 0
                      i32.const 1055932
                      i32.const 41
                      i32.const 1056014
                      i32.const 290
                      i32.const 1056304
                      i32.const 309
                      call $_ZN4core7unicode9printable5check17h2e35b7ca08ef1a57E
                      i32.eqz
                      br_if 1 (;@8;)
                      br 4 (;@5;)
                    end
                    local.get 0
                    i32.const 1056613
                    i32.const 38
                    i32.const 1056689
                    i32.const 175
                    i32.const 1056864
                    i32.const 419
                    call $_ZN4core7unicode9printable5check17h2e35b7ca08ef1a57E
                    br_if 3 (;@5;)
                  end
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.clz
                  i32.const 2
                  i32.shr_u
                  i32.const 7
                  i32.xor
                  i64.extend_i32_u
                  i64.const 21474836480
                  i64.or
                  local.set 6
                  br 1 (;@6;)
                end
                local.get 0
                i32.const 1
                i32.or
                i32.clz
                i32.const 2
                i32.shr_u
                i32.const 7
                i32.xor
                i64.extend_i32_u
                i64.const 21474836480
                i64.or
                local.set 6
              end
              i32.const 3
              local.set 3
              br 2 (;@3;)
            end
            i32.const 1
            local.set 3
            br 1 (;@3;)
          end
        end
        local.get 0
        local.set 5
      end
      loop  ;; label = @2
        local.get 3
        local.set 4
        i32.const 92
        local.set 0
        i32.const 1
        local.set 2
        i32.const 1
        local.set 3
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 4
                    br_table 2 (;@6;) 1 (;@7;) 5 (;@3;) 0 (;@8;) 2 (;@6;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 6
                          i64.const 32
                          i64.shr_u
                          i32.wrap_i64
                          i32.const 255
                          i32.and
                          br_table 5 (;@6;) 3 (;@8;) 2 (;@9;) 1 (;@10;) 0 (;@11;) 6 (;@5;) 5 (;@6;)
                        end
                        local.get 6
                        i64.const -1095216660481
                        i64.and
                        i64.const 12884901888
                        i64.or
                        local.set 6
                        i32.const 117
                        local.set 0
                        br 6 (;@4;)
                      end
                      local.get 6
                      i64.const -1095216660481
                      i64.and
                      i64.const 8589934592
                      i64.or
                      local.set 6
                      i32.const 123
                      local.set 0
                      br 5 (;@4;)
                    end
                    local.get 5
                    local.get 6
                    i32.wrap_i64
                    local.tee 4
                    i32.const 2
                    i32.shl
                    i32.const 28
                    i32.and
                    i32.shr_u
                    i32.const 15
                    i32.and
                    local.tee 3
                    i32.const 48
                    i32.or
                    local.get 3
                    i32.const 87
                    i32.add
                    local.get 3
                    i32.const 10
                    i32.lt_u
                    select
                    local.set 0
                    block  ;; label = @9
                      local.get 4
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 6
                      i64.const -1
                      i64.add
                      i64.const 4294967295
                      i64.and
                      local.get 6
                      i64.const -4294967296
                      i64.and
                      i64.or
                      local.set 6
                      br 5 (;@4;)
                    end
                    local.get 6
                    i64.const -1095216660481
                    i64.and
                    i64.const 4294967296
                    i64.or
                    local.set 6
                    br 4 (;@4;)
                  end
                  local.get 6
                  i64.const -1095216660481
                  i64.and
                  local.set 6
                  i32.const 125
                  local.set 0
                  br 3 (;@4;)
                end
                i32.const 0
                local.set 3
                local.get 5
                local.set 0
                br 3 (;@3;)
              end
              local.get 1
              i32.load offset=24
              i32.const 39
              local.get 1
              i32.load offset=28
              i32.load offset=16
              call_indirect (type 3)
              return
            end
            local.get 6
            i64.const -1095216660481
            i64.and
            i64.const 17179869184
            i64.or
            local.set 6
          end
          i32.const 3
          local.set 3
        end
        local.get 1
        i32.load offset=24
        local.get 0
        local.get 1
        i32.load offset=28
        i32.load offset=16
        call_indirect (type 3)
        i32.eqz
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (func $_ZN4core5slice6memchr7memrchr17h4b8437429e29ecf5E (type 4) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 3
    i32.const 0
    local.get 3
    i32.const 4
    local.get 2
    i32.const 3
    i32.and
    local.tee 4
    i32.sub
    i32.const 0
    local.get 4
    select
    local.tee 5
    i32.sub
    i32.const 7
    i32.and
    local.get 3
    local.get 5
    i32.lt_u
    local.tee 6
    select
    local.tee 4
    i32.sub
    local.set 7
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            local.get 4
            i32.lt_u
            br_if 0 (;@4;)
            local.get 3
            local.get 5
            local.get 6
            select
            local.set 8
            local.get 2
            local.get 7
            i32.add
            local.get 2
            local.get 3
            i32.add
            local.tee 5
            i32.sub
            local.set 6
            local.get 5
            i32.const -1
            i32.add
            local.set 5
            local.get 1
            i32.const 255
            i32.and
            local.set 9
            block  ;; label = @5
              loop  ;; label = @6
                local.get 4
                i32.eqz
                br_if 1 (;@5;)
                local.get 6
                i32.const 1
                i32.add
                local.set 6
                local.get 4
                i32.const -1
                i32.add
                local.set 4
                local.get 5
                i32.load8_u
                local.set 10
                local.get 5
                i32.const -1
                i32.add
                local.set 5
                local.get 10
                local.get 9
                i32.ne
                br_if 0 (;@6;)
              end
              local.get 7
              local.get 6
              i32.sub
              local.set 4
              br 3 (;@2;)
            end
            local.get 1
            i32.const 255
            i32.and
            i32.const 16843009
            i32.mul
            local.set 5
            block  ;; label = @5
              loop  ;; label = @6
                local.get 7
                local.tee 4
                local.get 8
                i32.le_u
                br_if 1 (;@5;)
                local.get 4
                i32.const -8
                i32.add
                local.set 7
                local.get 2
                local.get 4
                i32.add
                local.tee 6
                i32.const -4
                i32.add
                i32.load
                local.get 5
                i32.xor
                local.tee 10
                i32.const -1
                i32.xor
                local.get 10
                i32.const -16843009
                i32.add
                i32.and
                local.get 6
                i32.const -8
                i32.add
                i32.load
                local.get 5
                i32.xor
                local.tee 6
                i32.const -1
                i32.xor
                local.get 6
                i32.const -16843009
                i32.add
                i32.and
                i32.or
                i32.const -2139062144
                i32.and
                i32.eqz
                br_if 0 (;@6;)
              end
            end
            local.get 4
            local.get 3
            i32.gt_u
            br_if 1 (;@3;)
            local.get 2
            i32.const -1
            i32.add
            local.set 6
            local.get 1
            i32.const 255
            i32.and
            local.set 10
            loop  ;; label = @5
              block  ;; label = @6
                local.get 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 5
                br 5 (;@1;)
              end
              local.get 6
              local.get 4
              i32.add
              local.set 5
              local.get 4
              i32.const -1
              i32.add
              local.set 4
              local.get 5
              i32.load8_u
              local.get 10
              i32.eq
              br_if 3 (;@2;)
              br 0 (;@5;)
            end
          end
          local.get 7
          local.get 3
          i32.const 1054900
          call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
          unreachable
        end
        local.get 4
        local.get 3
        i32.const 1054916
        call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
        unreachable
      end
      i32.const 1
      local.set 5
    end
    local.get 0
    local.get 4
    i32.store offset=4
    local.get 0
    local.get 5
    i32.store)
  (func $_ZN4core5slice25slice_index_overflow_fail17h55e360d291e497e5E (type 1) (param i32)
    i32.const 1055040
    i32.const 44
    local.get 0
    call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
    unreachable)
  (func $_ZN4core3str5lossy9Utf8Lossy10from_bytes17ha2425d52cb87229aE (type 7) (param i32 i32 i32)
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN4core3str5lossy9Utf8Lossy6chunks17h8921da9536869963E (type 7) (param i32 i32 i32)
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN96_$LT$core..str..lossy..Utf8LossyChunksIter$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h98d561145d1e4712E (type 6) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load
      local.set 3
      i32.const 0
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        loop  ;; label = @19
                                          local.get 4
                                          i32.const 1
                                          i32.add
                                          local.set 5
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              local.get 3
                                              local.get 4
                                              i32.add
                                              local.tee 6
                                              i32.load8_u
                                              local.tee 7
                                              i32.const 24
                                              i32.shl
                                              i32.const 24
                                              i32.shr_s
                                              local.tee 8
                                              i32.const -1
                                              i32.le_s
                                              br_if 0 (;@21;)
                                              local.get 5
                                              local.set 4
                                              br 1 (;@20;)
                                            end
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    local.get 7
                                                    i32.const 1055338
                                                    i32.add
                                                    i32.load8_u
                                                    i32.const -2
                                                    i32.add
                                                    local.tee 9
                                                    i32.const 2
                                                    i32.gt_u
                                                    br_if 0 (;@24;)
                                                    local.get 9
                                                    br_table 1 (;@23;) 2 (;@22;) 3 (;@21;) 1 (;@23;)
                                                  end
                                                  local.get 2
                                                  local.get 4
                                                  i32.lt_u
                                                  br_if 7 (;@16;)
                                                  local.get 2
                                                  local.get 4
                                                  i32.le_u
                                                  br_if 8 (;@15;)
                                                  local.get 0
                                                  local.get 4
                                                  i32.store offset=4
                                                  local.get 0
                                                  local.get 3
                                                  i32.store
                                                  local.get 1
                                                  local.get 2
                                                  local.get 5
                                                  i32.sub
                                                  i32.store offset=4
                                                  local.get 1
                                                  local.get 3
                                                  local.get 5
                                                  i32.add
                                                  i32.store
                                                  local.get 0
                                                  i32.const 12
                                                  i32.add
                                                  i32.const 1
                                                  i32.store
                                                  local.get 0
                                                  i32.const 8
                                                  i32.add
                                                  local.get 6
                                                  i32.store
                                                  return
                                                end
                                                block  ;; label = @23
                                                  local.get 3
                                                  local.get 5
                                                  i32.add
                                                  local.tee 8
                                                  i32.const 0
                                                  local.get 2
                                                  local.get 5
                                                  i32.gt_u
                                                  select
                                                  local.tee 7
                                                  i32.const 1054249
                                                  local.get 7
                                                  select
                                                  i32.load8_u
                                                  i32.const 192
                                                  i32.and
                                                  i32.const 128
                                                  i32.ne
                                                  br_if 0 (;@23;)
                                                  local.get 4
                                                  i32.const 2
                                                  i32.add
                                                  local.set 4
                                                  br 3 (;@20;)
                                                end
                                                local.get 2
                                                local.get 4
                                                i32.lt_u
                                                br_if 8 (;@14;)
                                                local.get 2
                                                local.get 4
                                                i32.le_u
                                                br_if 9 (;@13;)
                                                local.get 1
                                                local.get 8
                                                i32.store
                                                local.get 0
                                                local.get 4
                                                i32.store offset=4
                                                local.get 0
                                                local.get 3
                                                i32.store
                                                local.get 1
                                                local.get 2
                                                local.get 5
                                                i32.sub
                                                i32.store offset=4
                                                local.get 0
                                                i32.const 12
                                                i32.add
                                                i32.const 1
                                                i32.store
                                                local.get 0
                                                i32.const 8
                                                i32.add
                                                local.get 6
                                                i32.store
                                                return
                                              end
                                              local.get 3
                                              local.get 5
                                              i32.add
                                              local.tee 10
                                              i32.const 0
                                              local.get 2
                                              local.get 5
                                              i32.gt_u
                                              select
                                              local.tee 9
                                              i32.const 1054249
                                              local.get 9
                                              select
                                              i32.load8_u
                                              local.set 9
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  local.get 7
                                                  i32.const -224
                                                  i32.add
                                                  local.tee 7
                                                  i32.const 13
                                                  i32.gt_u
                                                  br_if 0 (;@23;)
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      local.get 7
                                                      br_table 0 (;@25;) 2 (;@23;) 2 (;@23;) 2 (;@23;) 2 (;@23;) 2 (;@23;) 2 (;@23;) 2 (;@23;) 2 (;@23;) 2 (;@23;) 2 (;@23;) 2 (;@23;) 2 (;@23;) 1 (;@24;) 0 (;@25;)
                                                    end
                                                    local.get 9
                                                    i32.const 224
                                                    i32.and
                                                    i32.const 160
                                                    i32.eq
                                                    br_if 2 (;@22;)
                                                    br 22 (;@2;)
                                                  end
                                                  local.get 9
                                                  i32.const 24
                                                  i32.shl
                                                  i32.const 24
                                                  i32.shr_s
                                                  i32.const -1
                                                  i32.gt_s
                                                  br_if 21 (;@2;)
                                                  local.get 9
                                                  i32.const 255
                                                  i32.and
                                                  i32.const 160
                                                  i32.ge_u
                                                  br_if 21 (;@2;)
                                                  br 1 (;@22;)
                                                end
                                                block  ;; label = @23
                                                  local.get 8
                                                  i32.const 31
                                                  i32.add
                                                  i32.const 255
                                                  i32.and
                                                  i32.const 11
                                                  i32.gt_u
                                                  br_if 0 (;@23;)
                                                  local.get 9
                                                  i32.const 24
                                                  i32.shl
                                                  i32.const 24
                                                  i32.shr_s
                                                  i32.const -1
                                                  i32.gt_s
                                                  br_if 21 (;@2;)
                                                  local.get 9
                                                  i32.const 255
                                                  i32.and
                                                  i32.const 192
                                                  i32.ge_u
                                                  br_if 21 (;@2;)
                                                  br 1 (;@22;)
                                                end
                                                local.get 9
                                                i32.const 255
                                                i32.and
                                                i32.const 191
                                                i32.gt_u
                                                br_if 20 (;@2;)
                                                local.get 8
                                                i32.const 254
                                                i32.and
                                                i32.const 238
                                                i32.ne
                                                br_if 20 (;@2;)
                                                local.get 9
                                                i32.const 24
                                                i32.shl
                                                i32.const 24
                                                i32.shr_s
                                                i32.const -1
                                                i32.gt_s
                                                br_if 20 (;@2;)
                                              end
                                              block  ;; label = @22
                                                local.get 3
                                                local.get 4
                                                i32.const 2
                                                i32.add
                                                local.tee 5
                                                i32.add
                                                local.tee 8
                                                i32.const 0
                                                local.get 2
                                                local.get 5
                                                i32.gt_u
                                                select
                                                local.tee 7
                                                i32.const 1054249
                                                local.get 7
                                                select
                                                i32.load8_u
                                                i32.const 192
                                                i32.and
                                                i32.const 128
                                                i32.ne
                                                br_if 0 (;@22;)
                                                local.get 4
                                                i32.const 3
                                                i32.add
                                                local.set 4
                                                br 2 (;@20;)
                                              end
                                              local.get 2
                                              local.get 4
                                              i32.lt_u
                                              br_if 9 (;@12;)
                                              local.get 4
                                              i32.const -3
                                              i32.gt_u
                                              br_if 10 (;@11;)
                                              local.get 2
                                              local.get 5
                                              i32.lt_u
                                              br_if 11 (;@10;)
                                              local.get 1
                                              local.get 8
                                              i32.store
                                              local.get 0
                                              local.get 4
                                              i32.store offset=4
                                              local.get 0
                                              local.get 3
                                              i32.store
                                              local.get 1
                                              local.get 2
                                              local.get 5
                                              i32.sub
                                              i32.store offset=4
                                              local.get 0
                                              i32.const 12
                                              i32.add
                                              i32.const 2
                                              i32.store
                                              local.get 0
                                              i32.const 8
                                              i32.add
                                              local.get 6
                                              i32.store
                                              return
                                            end
                                            local.get 3
                                            local.get 5
                                            i32.add
                                            local.tee 10
                                            i32.const 0
                                            local.get 2
                                            local.get 5
                                            i32.gt_u
                                            select
                                            local.tee 9
                                            i32.const 1054249
                                            local.get 9
                                            select
                                            i32.load8_u
                                            local.set 9
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                local.get 7
                                                i32.const -240
                                                i32.add
                                                local.tee 7
                                                i32.const 4
                                                i32.gt_u
                                                br_if 0 (;@22;)
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    local.get 7
                                                    br_table 0 (;@24;) 2 (;@22;) 2 (;@22;) 2 (;@22;) 1 (;@23;) 0 (;@24;)
                                                  end
                                                  local.get 9
                                                  i32.const 112
                                                  i32.add
                                                  i32.const 255
                                                  i32.and
                                                  i32.const 48
                                                  i32.lt_u
                                                  br_if 2 (;@21;)
                                                  br 20 (;@3;)
                                                end
                                                local.get 9
                                                i32.const 24
                                                i32.shl
                                                i32.const 24
                                                i32.shr_s
                                                i32.const -1
                                                i32.gt_s
                                                br_if 19 (;@3;)
                                                local.get 9
                                                i32.const 255
                                                i32.and
                                                i32.const 144
                                                i32.ge_u
                                                br_if 19 (;@3;)
                                                br 1 (;@21;)
                                              end
                                              local.get 9
                                              i32.const 255
                                              i32.and
                                              i32.const 191
                                              i32.gt_u
                                              br_if 18 (;@3;)
                                              local.get 8
                                              i32.const 15
                                              i32.add
                                              i32.const 255
                                              i32.and
                                              i32.const 2
                                              i32.gt_u
                                              br_if 18 (;@3;)
                                              local.get 9
                                              i32.const 24
                                              i32.shl
                                              i32.const 24
                                              i32.shr_s
                                              i32.const -1
                                              i32.gt_s
                                              br_if 18 (;@3;)
                                            end
                                            local.get 3
                                            local.get 4
                                            i32.const 2
                                            i32.add
                                            local.tee 5
                                            i32.add
                                            local.tee 8
                                            i32.const 0
                                            local.get 2
                                            local.get 5
                                            i32.gt_u
                                            select
                                            local.tee 7
                                            i32.const 1054249
                                            local.get 7
                                            select
                                            i32.load8_u
                                            i32.const 192
                                            i32.and
                                            i32.const 128
                                            i32.ne
                                            br_if 2 (;@18;)
                                            local.get 3
                                            local.get 4
                                            i32.const 3
                                            i32.add
                                            local.tee 5
                                            i32.add
                                            local.tee 8
                                            i32.const 0
                                            local.get 2
                                            local.get 5
                                            i32.gt_u
                                            select
                                            local.tee 7
                                            i32.const 1054249
                                            local.get 7
                                            select
                                            i32.load8_u
                                            i32.const 192
                                            i32.and
                                            i32.const 128
                                            i32.ne
                                            br_if 3 (;@17;)
                                            local.get 4
                                            i32.const 4
                                            i32.add
                                            local.set 4
                                          end
                                          local.get 4
                                          local.get 2
                                          i32.lt_u
                                          br_if 0 (;@19;)
                                        end
                                        local.get 1
                                        i32.const 0
                                        i32.store offset=4
                                        local.get 1
                                        i32.const 1054248
                                        i32.store
                                        local.get 0
                                        local.get 2
                                        i32.store offset=4
                                        local.get 0
                                        local.get 3
                                        i32.store
                                        local.get 0
                                        i32.const 12
                                        i32.add
                                        i32.const 0
                                        i32.store
                                        local.get 0
                                        i32.const 8
                                        i32.add
                                        i32.const 1054248
                                        i32.store
                                        return
                                      end
                                      local.get 2
                                      local.get 4
                                      i32.lt_u
                                      br_if 8 (;@9;)
                                      local.get 4
                                      i32.const -3
                                      i32.gt_u
                                      br_if 9 (;@8;)
                                      local.get 2
                                      local.get 5
                                      i32.lt_u
                                      br_if 10 (;@7;)
                                      local.get 1
                                      local.get 8
                                      i32.store
                                      local.get 0
                                      local.get 4
                                      i32.store offset=4
                                      local.get 0
                                      local.get 3
                                      i32.store
                                      local.get 1
                                      local.get 2
                                      local.get 5
                                      i32.sub
                                      i32.store offset=4
                                      local.get 0
                                      i32.const 12
                                      i32.add
                                      i32.const 2
                                      i32.store
                                      local.get 0
                                      i32.const 8
                                      i32.add
                                      local.get 6
                                      i32.store
                                      return
                                    end
                                    local.get 2
                                    local.get 4
                                    i32.lt_u
                                    br_if 10 (;@6;)
                                    local.get 4
                                    i32.const -4
                                    i32.gt_u
                                    br_if 11 (;@5;)
                                    local.get 2
                                    local.get 5
                                    i32.lt_u
                                    br_if 12 (;@4;)
                                    local.get 1
                                    local.get 8
                                    i32.store
                                    local.get 0
                                    local.get 4
                                    i32.store offset=4
                                    local.get 0
                                    local.get 3
                                    i32.store
                                    local.get 1
                                    local.get 2
                                    local.get 5
                                    i32.sub
                                    i32.store offset=4
                                    local.get 0
                                    i32.const 12
                                    i32.add
                                    i32.const 3
                                    i32.store
                                    local.get 0
                                    i32.const 8
                                    i32.add
                                    local.get 6
                                    i32.store
                                    return
                                  end
                                  local.get 4
                                  local.get 2
                                  i32.const 1055152
                                  call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
                                  unreachable
                                end
                                local.get 5
                                local.get 2
                                i32.const 1055152
                                call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
                                unreachable
                              end
                              local.get 4
                              local.get 2
                              i32.const 1055248
                              call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
                              unreachable
                            end
                            local.get 5
                            local.get 2
                            i32.const 1055248
                            call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
                            unreachable
                          end
                          local.get 4
                          local.get 2
                          i32.const 1055216
                          call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
                          unreachable
                        end
                        local.get 4
                        local.get 5
                        i32.const 1055216
                        call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
                        unreachable
                      end
                      local.get 5
                      local.get 2
                      i32.const 1055216
                      call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
                      unreachable
                    end
                    local.get 4
                    local.get 2
                    i32.const 1055168
                    call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
                    unreachable
                  end
                  local.get 4
                  local.get 5
                  i32.const 1055168
                  call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
                  unreachable
                end
                local.get 5
                local.get 2
                i32.const 1055168
                call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
                unreachable
              end
              local.get 4
              local.get 2
              i32.const 1055184
              call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
              unreachable
            end
            local.get 4
            local.get 5
            i32.const 1055184
            call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
            unreachable
          end
          local.get 5
          local.get 2
          i32.const 1055184
          call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
          unreachable
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            local.get 4
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            local.get 4
            i32.le_u
            br_if 1 (;@3;)
            local.get 1
            local.get 10
            i32.store
            local.get 0
            local.get 4
            i32.store offset=4
            local.get 0
            local.get 3
            i32.store
            local.get 1
            local.get 2
            local.get 5
            i32.sub
            i32.store offset=4
            local.get 0
            i32.const 12
            i32.add
            i32.const 1
            i32.store
            local.get 0
            i32.const 8
            i32.add
            local.get 6
            i32.store
            return
          end
          local.get 4
          local.get 2
          i32.const 1055200
          call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
          unreachable
        end
        local.get 5
        local.get 2
        i32.const 1055200
        call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
        unreachable
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          local.get 4
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          i32.le_u
          br_if 1 (;@2;)
          local.get 1
          local.get 10
          i32.store
          local.get 0
          local.get 4
          i32.store offset=4
          local.get 0
          local.get 3
          i32.store
          local.get 1
          local.get 2
          local.get 5
          i32.sub
          i32.store offset=4
          local.get 0
          i32.const 12
          i32.add
          i32.const 1
          i32.store
          local.get 0
          i32.const 8
          i32.add
          local.get 6
          i32.store
          return
        end
        local.get 4
        local.get 2
        i32.const 1055232
        call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
        unreachable
      end
      local.get 5
      local.get 2
      i32.const 1055232
      call $_ZN4core5slice20slice_index_len_fail17h23d670b14a68e871E
      unreachable
    end
    local.get 0
    i32.const 0
    i32.store)
  (func $_ZN66_$LT$core..str..lossy..Utf8Lossy$u20$as$u20$core..fmt..Display$GT$3fmt17hb03f341134eb2e55E (type 8) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.store offset=12
          local.get 3
          local.get 0
          i32.store offset=8
          local.get 3
          i32.const 16
          i32.add
          local.get 3
          i32.const 8
          i32.add
          call $_ZN96_$LT$core..str..lossy..Utf8LossyChunksIter$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h98d561145d1e4712E
          block  ;; label = @4
            local.get 3
            i32.load offset=16
            local.tee 0
            i32.eqz
            br_if 0 (;@4;)
            loop  ;; label = @5
              local.get 3
              i32.load offset=28
              local.set 4
              local.get 3
              i32.load offset=20
              local.tee 5
              local.get 1
              i32.eq
              br_if 3 (;@2;)
              i32.const 1
              local.set 6
              local.get 2
              i32.load offset=24
              local.get 0
              local.get 5
              local.get 2
              i32.load offset=28
              i32.load offset=12
              call_indirect (type 8)
              br_if 4 (;@1;)
              block  ;; label = @6
                local.get 4
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                i32.load offset=24
                i32.const 65533
                local.get 2
                i32.load offset=28
                i32.load offset=16
                call_indirect (type 3)
                br_if 5 (;@1;)
              end
              local.get 3
              i32.const 16
              i32.add
              local.get 3
              i32.const 8
              i32.add
              call $_ZN96_$LT$core..str..lossy..Utf8LossyChunksIter$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h98d561145d1e4712E
              local.get 3
              i32.load offset=16
              local.tee 0
              br_if 0 (;@5;)
            end
          end
          i32.const 0
          local.set 6
          br 2 (;@1;)
        end
        local.get 2
        i32.const 1054248
        i32.const 0
        call $_ZN4core3fmt9Formatter3pad17h5d1a27371f812187E
        local.set 6
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        local.get 1
        call $_ZN4core3fmt9Formatter3pad17h5d1a27371f812187E
        local.set 6
        br 1 (;@1;)
      end
      i32.const 1055264
      i32.const 35
      i32.const 1055300
      call $_ZN4core9panicking5panic17he0bb7a4a857bed0cE
      unreachable
    end
    local.get 3
    i32.const 32
    i32.add
    global.set 0
    local.get 6)
  (func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i8$GT$3fmt17h520fc9cf30ca6ce8E (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.load8_u
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      local.get 0
      i32.add
      i32.const 127
      i32.add
      local.get 3
      i32.const 15
      i32.and
      local.tee 4
      i32.const 48
      i32.or
      local.get 4
      i32.const 87
      i32.add
      local.get 4
      i32.const 10
      i32.lt_u
      select
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 4
      i32.shr_u
      i32.const 15
      i32.and
      local.tee 3
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 0
      i32.const 128
      i32.add
      local.tee 3
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 128
      i32.const 1054556
      call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1054572
    i32.const 2
    local.get 2
    local.get 0
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h56cb6b936c09c882E
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set 0
    local.get 0)
  (func $_ZN4core3str9from_utf817h4147d06a7789f81eE (type 7) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i64 i32 i64)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.sub
            i32.const 0
            local.get 1
            i32.const 3
            i32.and
            select
            local.set 3
            i32.const 0
            local.get 2
            i32.const -7
            i32.add
            local.tee 4
            local.get 4
            local.get 2
            i32.gt_u
            select
            local.set 5
            i32.const 0
            local.set 4
            loop  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  local.get 4
                  i32.add
                  i32.load8_u
                  local.tee 6
                  i32.const 24
                  i32.shl
                  i32.const 24
                  i32.shr_s
                  local.tee 7
                  i32.const -1
                  i32.gt_s
                  br_if 0 (;@7;)
                  i64.const 1099511627776
                  local.set 8
                  block  ;; label = @8
                    local.get 6
                    i32.const 1055338
                    i32.add
                    i32.load8_u
                    i32.const -2
                    i32.add
                    local.tee 9
                    i32.const 2
                    i32.le_u
                    br_if 0 (;@8;)
                    i64.const 4294967296
                    local.set 10
                    br 7 (;@1;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 9
                            br_table 0 (;@12;) 1 (;@11;) 2 (;@10;) 0 (;@12;)
                          end
                          local.get 4
                          i32.const 1
                          i32.add
                          local.tee 6
                          local.get 2
                          i32.lt_u
                          br_if 2 (;@9;)
                          i64.const 0
                          local.set 10
                          br 9 (;@2;)
                        end
                        i64.const 0
                        local.set 10
                        local.get 4
                        i32.const 1
                        i32.add
                        local.tee 9
                        local.get 2
                        i32.ge_u
                        br_if 8 (;@2;)
                        local.get 1
                        local.get 9
                        i32.add
                        i32.load8_u
                        local.set 9
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 6
                            i32.const -224
                            i32.add
                            local.tee 6
                            i32.const 13
                            i32.gt_u
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 6
                                br_table 0 (;@14;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 2 (;@12;) 1 (;@13;) 0 (;@14;)
                              end
                              local.get 9
                              i32.const 224
                              i32.and
                              i32.const 160
                              i32.eq
                              br_if 2 (;@11;)
                              i64.const 4294967296
                              local.set 10
                              br 12 (;@1;)
                            end
                            block  ;; label = @13
                              local.get 9
                              i32.const 24
                              i32.shl
                              i32.const 24
                              i32.shr_s
                              i32.const -1
                              i32.le_s
                              br_if 0 (;@13;)
                              i64.const 4294967296
                              local.set 10
                              br 12 (;@1;)
                            end
                            local.get 9
                            i32.const 255
                            i32.and
                            i32.const 160
                            i32.lt_u
                            br_if 1 (;@11;)
                            i64.const 4294967296
                            local.set 10
                            br 11 (;@1;)
                          end
                          block  ;; label = @12
                            local.get 7
                            i32.const 31
                            i32.add
                            i32.const 255
                            i32.and
                            i32.const 11
                            i32.gt_u
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              local.get 9
                              i32.const 24
                              i32.shl
                              i32.const 24
                              i32.shr_s
                              i32.const -1
                              i32.le_s
                              br_if 0 (;@13;)
                              i64.const 4294967296
                              local.set 10
                              br 12 (;@1;)
                            end
                            local.get 9
                            i32.const 255
                            i32.and
                            i32.const 192
                            i32.lt_u
                            br_if 1 (;@11;)
                            i64.const 4294967296
                            local.set 10
                            br 11 (;@1;)
                          end
                          block  ;; label = @12
                            local.get 9
                            i32.const 255
                            i32.and
                            i32.const 191
                            i32.le_u
                            br_if 0 (;@12;)
                            i64.const 4294967296
                            local.set 10
                            br 11 (;@1;)
                          end
                          block  ;; label = @12
                            local.get 7
                            i32.const 254
                            i32.and
                            i32.const 238
                            i32.eq
                            br_if 0 (;@12;)
                            i64.const 4294967296
                            local.set 10
                            br 11 (;@1;)
                          end
                          local.get 9
                          i32.const 24
                          i32.shl
                          i32.const 24
                          i32.shr_s
                          i32.const -1
                          i32.le_s
                          br_if 0 (;@11;)
                          i64.const 4294967296
                          local.set 10
                          br 10 (;@1;)
                        end
                        i64.const 0
                        local.set 8
                        local.get 4
                        i32.const 2
                        i32.add
                        local.tee 6
                        local.get 2
                        i32.ge_u
                        br_if 9 (;@1;)
                        local.get 1
                        local.get 6
                        i32.add
                        i32.load8_u
                        i32.const 192
                        i32.and
                        i32.const 128
                        i32.eq
                        br_if 2 (;@8;)
                        br 7 (;@3;)
                      end
                      i64.const 0
                      local.set 10
                      local.get 4
                      i32.const 1
                      i32.add
                      local.tee 9
                      local.get 2
                      i32.ge_u
                      br_if 7 (;@2;)
                      local.get 1
                      local.get 9
                      i32.add
                      i32.load8_u
                      local.set 9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 6
                          i32.const -240
                          i32.add
                          local.tee 6
                          i32.const 4
                          i32.gt_u
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 6
                              br_table 0 (;@13;) 2 (;@11;) 2 (;@11;) 2 (;@11;) 1 (;@12;) 0 (;@13;)
                            end
                            local.get 9
                            i32.const 112
                            i32.add
                            i32.const 255
                            i32.and
                            i32.const 48
                            i32.lt_u
                            br_if 2 (;@10;)
                            i64.const 4294967296
                            local.set 10
                            br 11 (;@1;)
                          end
                          block  ;; label = @12
                            local.get 9
                            i32.const 24
                            i32.shl
                            i32.const 24
                            i32.shr_s
                            i32.const -1
                            i32.le_s
                            br_if 0 (;@12;)
                            i64.const 4294967296
                            local.set 10
                            br 11 (;@1;)
                          end
                          local.get 9
                          i32.const 255
                          i32.and
                          i32.const 144
                          i32.lt_u
                          br_if 1 (;@10;)
                          i64.const 4294967296
                          local.set 10
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          local.get 9
                          i32.const 255
                          i32.and
                          i32.const 191
                          i32.le_u
                          br_if 0 (;@11;)
                          i64.const 4294967296
                          local.set 10
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          local.get 7
                          i32.const 15
                          i32.add
                          i32.const 255
                          i32.and
                          i32.const 2
                          i32.le_u
                          br_if 0 (;@11;)
                          i64.const 4294967296
                          local.set 10
                          br 10 (;@1;)
                        end
                        local.get 9
                        i32.const 24
                        i32.shl
                        i32.const 24
                        i32.shr_s
                        i32.const -1
                        i32.le_s
                        br_if 0 (;@10;)
                        i64.const 4294967296
                        local.set 10
                        br 9 (;@1;)
                      end
                      local.get 4
                      i32.const 2
                      i32.add
                      local.tee 6
                      local.get 2
                      i32.ge_u
                      br_if 7 (;@2;)
                      local.get 1
                      local.get 6
                      i32.add
                      i32.load8_u
                      i32.const 192
                      i32.and
                      i32.const 128
                      i32.ne
                      br_if 6 (;@3;)
                      i64.const 0
                      local.set 8
                      local.get 4
                      i32.const 3
                      i32.add
                      local.tee 6
                      local.get 2
                      i32.ge_u
                      br_if 8 (;@1;)
                      local.get 1
                      local.get 6
                      i32.add
                      i32.load8_u
                      i32.const 192
                      i32.and
                      i32.const 128
                      i32.eq
                      br_if 1 (;@8;)
                      i64.const 3298534883328
                      local.set 8
                      i64.const 4294967296
                      local.set 10
                      br 8 (;@1;)
                    end
                    i64.const 4294967296
                    local.set 10
                    local.get 1
                    local.get 6
                    i32.add
                    i32.load8_u
                    i32.const 192
                    i32.and
                    i32.const 128
                    i32.ne
                    br_if 7 (;@1;)
                  end
                  local.get 6
                  i32.const 1
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 3
                  local.get 4
                  i32.sub
                  i32.const 3
                  i32.and
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 4
                    local.get 5
                    i32.ge_u
                    br_if 0 (;@8;)
                    loop  ;; label = @9
                      local.get 1
                      local.get 4
                      i32.add
                      local.tee 6
                      i32.const 4
                      i32.add
                      i32.load
                      local.get 6
                      i32.load
                      i32.or
                      i32.const -2139062144
                      i32.and
                      br_if 1 (;@8;)
                      local.get 4
                      i32.const 8
                      i32.add
                      local.tee 4
                      local.get 5
                      i32.lt_u
                      br_if 0 (;@9;)
                    end
                  end
                  local.get 4
                  local.get 2
                  i32.ge_u
                  br_if 1 (;@6;)
                  loop  ;; label = @8
                    local.get 1
                    local.get 4
                    i32.add
                    i32.load8_s
                    i32.const 0
                    i32.lt_s
                    br_if 2 (;@6;)
                    local.get 2
                    local.get 4
                    i32.const 1
                    i32.add
                    local.tee 4
                    i32.ne
                    br_if 0 (;@8;)
                    br 4 (;@4;)
                  end
                end
                local.get 4
                i32.const 1
                i32.add
                local.set 4
              end
              local.get 4
              local.get 2
              i32.lt_u
              br_if 0 (;@5;)
            end
          end
          local.get 0
          local.get 1
          i32.store offset=4
          local.get 0
          i32.const 8
          i32.add
          local.get 2
          i32.store
          local.get 0
          i32.const 0
          i32.store
          return
        end
        i64.const 2199023255552
        local.set 8
        i64.const 4294967296
        local.set 10
        br 1 (;@1;)
      end
      i64.const 0
      local.set 8
    end
    local.get 0
    local.get 10
    local.get 4
    i64.extend_i32_u
    i64.or
    local.get 8
    i64.or
    i64.store offset=4 align=4
    local.get 0
    i32.const 1
    i32.store)
  (func $_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17h9ace9957d1dfdd97E (type 3) (param i32 i32) (result i32)
    local.get 0
    i64.load8_u
    i32.const 1
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h34d165111a85fc91E)
  (func $_ZN4core7unicode9printable12is_printable17h576ae3d8aaeb2915E (type 5) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.const 65536
      i32.lt_u
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 131072
          i32.lt_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          local.get 0
          i32.const -201547
          i32.add
          i32.const 716213
          i32.lt_u
          br_if 1 (;@2;)
          local.get 0
          i32.const -195102
          i32.add
          i32.const 1506
          i32.lt_u
          br_if 1 (;@2;)
          local.get 0
          i32.const -191457
          i32.add
          i32.const 3103
          i32.lt_u
          br_if 1 (;@2;)
          local.get 0
          i32.const -183970
          i32.add
          i32.const 14
          i32.lt_u
          br_if 1 (;@2;)
          local.get 0
          i32.const 2097150
          i32.and
          i32.const 178206
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const -173790
          i32.add
          i32.const 34
          i32.lt_u
          br_if 1 (;@2;)
          local.get 0
          i32.const -177973
          i32.add
          i32.const 11
          i32.lt_u
          br_if 1 (;@2;)
          local.get 0
          i32.const -918000
          i32.add
          i32.const 196111
          i32.gt_u
          return
        end
        local.get 0
        i32.const 1056613
        i32.const 38
        i32.const 1056689
        i32.const 175
        i32.const 1056864
        i32.const 419
        call $_ZN4core7unicode9printable5check17h2e35b7ca08ef1a57E
        local.set 1
      end
      local.get 1
      return
    end
    local.get 0
    i32.const 1055932
    i32.const 41
    i32.const 1056014
    i32.const 290
    i32.const 1056304
    i32.const 309
    call $_ZN4core7unicode9printable5check17h2e35b7ca08ef1a57E)
  (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h84435a511eccf523E (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.load
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      local.get 0
      i32.add
      i32.const 127
      i32.add
      local.get 3
      i32.const 15
      i32.and
      local.tee 4
      i32.const 48
      i32.or
      local.get 4
      i32.const 87
      i32.add
      local.get 4
      i32.const 10
      i32.lt_u
      select
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 4
      i32.shr_u
      local.tee 3
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 0
      i32.const 128
      i32.add
      local.tee 3
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 128
      i32.const 1054556
      call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1054572
    i32.const 2
    local.get 2
    local.get 0
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h56cb6b936c09c882E
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set 0
    local.get 0)
  (func $_ZN4core3fmt3num3imp7fmt_u6417h34d165111a85fc91E (type 15) (param i64 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    i32.const 39
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.const 10000
        i64.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 5
        br 1 (;@1;)
      end
      i32.const 39
      local.set 4
      loop  ;; label = @2
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.add
        local.tee 6
        i32.const -4
        i32.add
        local.get 0
        local.get 0
        i64.const 10000
        i64.div_u
        local.tee 5
        i64.const 10000
        i64.mul
        i64.sub
        i32.wrap_i64
        local.tee 7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 8
        i32.const 1
        i32.shl
        i32.const 1054574
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 6
        i32.const -2
        i32.add
        local.get 7
        local.get 8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.const 1054574
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 4
        i32.const -4
        i32.add
        local.set 4
        local.get 0
        i64.const 99999999
        i64.gt_u
        local.set 6
        local.get 5
        local.set 0
        local.get 6
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 5
      i32.wrap_i64
      local.tee 6
      i32.const 99
      i32.le_s
      br_if 0 (;@1;)
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -2
      i32.add
      local.tee 4
      i32.add
      local.get 5
      i32.wrap_i64
      local.tee 6
      local.get 6
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 6
      i32.const 100
      i32.mul
      i32.sub
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.const 1054574
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 10
        i32.lt_s
        br_if 0 (;@2;)
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.const -2
        i32.add
        local.tee 4
        i32.add
        local.get 6
        i32.const 1
        i32.shl
        i32.const 1054574
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        br 1 (;@1;)
      end
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -1
      i32.add
      local.tee 4
      i32.add
      local.get 6
      i32.const 48
      i32.add
      i32.store8
    end
    local.get 2
    local.get 1
    i32.const 1054248
    i32.const 0
    local.get 3
    i32.const 9
    i32.add
    local.get 4
    i32.add
    i32.const 39
    local.get 4
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h56cb6b936c09c882E
    local.set 4
    local.get 3
    i32.const 48
    i32.add
    global.set 0
    local.get 4)
  (func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i8$GT$3fmt17hf0602dfa1b51374aE (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.load8_u
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      local.get 0
      i32.add
      i32.const 127
      i32.add
      local.get 3
      i32.const 15
      i32.and
      local.tee 4
      i32.const 48
      i32.or
      local.get 4
      i32.const 55
      i32.add
      local.get 4
      i32.const 10
      i32.lt_u
      select
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 4
      i32.shr_u
      i32.const 15
      i32.and
      local.tee 3
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 0
      i32.const 128
      i32.add
      local.tee 3
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 128
      i32.const 1054556
      call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1054572
    i32.const 2
    local.get 2
    local.get 0
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h56cb6b936c09c882E
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set 0
    local.get 0)
  (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17hf6dfd165e0a82f4aE (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.load
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      local.get 0
      i32.add
      i32.const 127
      i32.add
      local.get 3
      i32.const 15
      i32.and
      local.tee 4
      i32.const 48
      i32.or
      local.get 4
      i32.const 55
      i32.add
      local.get 4
      i32.const 10
      i32.lt_u
      select
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 4
      i32.shr_u
      local.tee 3
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 0
      i32.const 128
      i32.add
      local.tee 3
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 128
      i32.const 1054556
      call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1054572
    i32.const 2
    local.get 2
    local.get 0
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h56cb6b936c09c882E
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set 0
    local.get 0)
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h6a0f8a8815814437E (type 3) (param i32 i32) (result i32)
    (local i64)
    local.get 0
    i32.load
    local.tee 0
    i64.extend_i32_s
    local.tee 2
    local.get 2
    i64.const 63
    i64.shr_s
    local.tee 2
    i64.add
    local.get 2
    i64.xor
    local.get 0
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h34d165111a85fc91E)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h061cea3d0e32c42bE (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h264ea309efcc35d6E)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h40152972685c8e83E (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 0
        i32.load8_u
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.load offset=24
        i32.const 1057384
        i32.const 4
        local.get 1
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 8)
        i32.store8 offset=8
        local.get 2
        local.get 1
        i32.store
        local.get 2
        i32.const 0
        i32.store8 offset=9
        local.get 2
        i32.const 0
        i32.store offset=4
        local.get 2
        local.get 0
        i32.const 1
        i32.add
        i32.store offset=12
        local.get 2
        local.get 2
        i32.const 12
        i32.add
        i32.const 1054516
        call $_ZN4core3fmt8builders10DebugTuple5field17ha8d7daf60661e76bE
        drop
        local.get 2
        i32.load8_u offset=8
        local.set 1
        block  ;; label = @3
          local.get 2
          i32.load offset=4
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 255
          i32.and
          local.set 0
          i32.const 1
          local.set 1
          block  ;; label = @4
            local.get 0
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 3
              i32.const 1
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              i32.load8_u offset=9
              i32.const 255
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.load
              local.tee 0
              i32.load8_u
              i32.const 4
              i32.and
              br_if 0 (;@5;)
              i32.const 1
              local.set 1
              local.get 0
              i32.load offset=24
              i32.const 1054512
              i32.const 1
              local.get 0
              i32.const 28
              i32.add
              i32.load
              i32.load offset=12
              call_indirect (type 8)
              br_if 1 (;@4;)
            end
            local.get 2
            i32.load
            local.tee 1
            i32.load offset=24
            i32.const 1054513
            i32.const 1
            local.get 1
            i32.const 28
            i32.add
            i32.load
            i32.load offset=12
            call_indirect (type 8)
            local.set 1
          end
          local.get 2
          local.get 1
          i32.store8 offset=8
        end
        local.get 1
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=24
      i32.const 1057388
      i32.const 4
      local.get 1
      i32.const 28
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 8)
      local.set 1
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hcaf25e9d3ce3562aE (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 2
    global.set 0
    local.get 0
    i32.load
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load
              local.tee 3
              i32.const 16
              i32.and
              br_if 0 (;@5;)
              local.get 0
              i32.load8_u
              local.set 4
              local.get 3
              i32.const 32
              i32.and
              br_if 1 (;@4;)
              local.get 4
              i64.extend_i32_u
              i64.const 255
              i64.and
              i32.const 1
              local.get 1
              call $_ZN4core3fmt3num3imp7fmt_u6417h34d165111a85fc91E
              local.set 0
              br 2 (;@3;)
            end
            local.get 0
            i32.load8_u
            local.set 4
            i32.const 0
            local.set 0
            loop  ;; label = @5
              local.get 2
              local.get 0
              i32.add
              i32.const 127
              i32.add
              local.get 4
              i32.const 15
              i32.and
              local.tee 3
              i32.const 48
              i32.or
              local.get 3
              i32.const 87
              i32.add
              local.get 3
              i32.const 10
              i32.lt_u
              select
              i32.store8
              local.get 0
              i32.const -1
              i32.add
              local.set 0
              local.get 4
              i32.const 4
              i32.shr_u
              i32.const 15
              i32.and
              local.tee 4
              br_if 0 (;@5;)
            end
            local.get 0
            i32.const 128
            i32.add
            local.tee 4
            i32.const 129
            i32.ge_u
            br_if 2 (;@2;)
            local.get 1
            i32.const 1
            i32.const 1054572
            i32.const 2
            local.get 2
            local.get 0
            i32.add
            i32.const 128
            i32.add
            i32.const 0
            local.get 0
            i32.sub
            call $_ZN4core3fmt9Formatter12pad_integral17h56cb6b936c09c882E
            local.set 0
            br 1 (;@3;)
          end
          i32.const 0
          local.set 0
          loop  ;; label = @4
            local.get 2
            local.get 0
            i32.add
            i32.const 127
            i32.add
            local.get 4
            i32.const 15
            i32.and
            local.tee 3
            i32.const 48
            i32.or
            local.get 3
            i32.const 55
            i32.add
            local.get 3
            i32.const 10
            i32.lt_u
            select
            i32.store8
            local.get 0
            i32.const -1
            i32.add
            local.set 0
            local.get 4
            i32.const 4
            i32.shr_u
            i32.const 15
            i32.and
            local.tee 4
            br_if 0 (;@4;)
          end
          local.get 0
          i32.const 128
          i32.add
          local.tee 4
          i32.const 129
          i32.ge_u
          br_if 2 (;@1;)
          local.get 1
          i32.const 1
          i32.const 1054572
          i32.const 2
          local.get 2
          local.get 0
          i32.add
          i32.const 128
          i32.add
          i32.const 0
          local.get 0
          i32.sub
          call $_ZN4core3fmt9Formatter12pad_integral17h56cb6b936c09c882E
          local.set 0
        end
        local.get 2
        i32.const 128
        i32.add
        global.set 0
        local.get 0
        return
      end
      local.get 4
      i32.const 128
      i32.const 1054556
      call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
      unreachable
    end
    local.get 4
    i32.const 128
    i32.const 1054556
    call $_ZN4core5slice22slice_index_order_fail17h38bea6838a5ffdeaE
    unreachable)
  (func $_ZN57_$LT$core..str..Utf8Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h0736023f89ec8051E (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 1
    i32.load offset=24
    i32.const 1057392
    i32.const 9
    local.get 1
    i32.const 28
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 8)
    local.set 3
    local.get 2
    i32.const 0
    i32.store8 offset=5
    local.get 2
    local.get 3
    i32.store8 offset=4
    local.get 2
    local.get 1
    i32.store
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    i32.const 1057401
    i32.const 11
    local.get 2
    i32.const 12
    i32.add
    i32.const 1057368
    call $_ZN4core3fmt8builders11DebugStruct5field17h6969da1bb0a508efE
    drop
    local.get 2
    local.get 0
    i32.const 4
    i32.add
    i32.store offset=12
    local.get 2
    i32.const 1057412
    i32.const 9
    local.get 2
    i32.const 12
    i32.add
    i32.const 1057424
    call $_ZN4core3fmt8builders11DebugStruct5field17h6969da1bb0a508efE
    drop
    local.get 2
    i32.load8_u offset=4
    local.set 1
    block  ;; label = @1
      local.get 2
      i32.load8_u offset=5
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const 255
      i32.and
      local.set 0
      i32.const 1
      local.set 1
      block  ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        local.get 2
        i32.load
        local.tee 1
        i32.const 28
        i32.add
        i32.load
        i32.load offset=12
        local.set 0
        local.get 1
        i32.load offset=24
        local.set 3
        block  ;; label = @3
          local.get 1
          i32.load8_u
          i32.const 4
          i32.and
          br_if 0 (;@3;)
          local.get 3
          i32.const 1054507
          i32.const 2
          local.get 0
          call_indirect (type 8)
          local.set 1
          br 1 (;@2;)
        end
        local.get 3
        i32.const 1054506
        i32.const 1
        local.get 0
        call_indirect (type 8)
        local.set 1
      end
      local.get 2
      local.get 1
      i32.store8 offset=4
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1
    i32.const 255
    i32.and
    i32.const 0
    i32.ne)
  (table (;0;) 95 95 funcref)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1058912))
  (global (;2;) i32 (i32.const 1058912))
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "__original_main" (func $__original_main))
  (export "main" (func $main))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (elem (;0;) (i32.const 1) func $_ZN4core3ptr13drop_in_place17hbdefc172b9ada5feE $_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h0e98a8fdad6ece05E $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h19a2a61da5d6a26cE $_ZN5hello4main17hd078db076938ab99E $_ZN45_$LT$$RF$T$u20$as$u20$core..fmt..UpperHex$GT$3fmt17hb918cce28d9d0601E $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h74a61b11f6dc7b9dE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h72010bc18c2c3871E $_ZN60_$LT$std..io..error..Error$u20$as$u20$core..fmt..Display$GT$3fmt17hb3ec362a48a590eeE $_ZN55_$LT$std..path..Display$u20$as$u20$core..fmt..Debug$GT$3fmt17h23d105d427099b82E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h3f42ebff8fc1778aE $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h6a0f8a8815814437E $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17h70c46c42c25c7b72E $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17he6ead8fc076aace0E $_ZN3std5alloc24default_alloc_error_hook17h2080d072101c71d6E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h52ad5ba400a1c0b2E $_ZN91_$LT$std..sys_common..backtrace.._print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$3fmt17hf61cfde2fe9b6125E $_ZN4core3ptr13drop_in_place17h02e69d70ceca204bE $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h1d2341287c3c1530E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2b6afd714e60244dE $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h424f8a87ef227754E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h244888c2b6dd19d8E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17hf61ed0efe1fa8f1aE $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h7883bd689e386d70E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17heec17b7d6bd2890dE $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17hd4204762d830caa6E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hf5f9ccb98e7f13b1E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h935565c54b9e7992E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h0392c58b36b5e65cE $_ZN60_$LT$core..cell..BorrowError$u20$as$u20$core..fmt..Debug$GT$3fmt17hcb497cdb5137530aE $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h4131a8147211fa76E $_ZN4core3ptr13drop_in_place17hf3262b356a2935b1E $_ZN62_$LT$std..ffi..c_str..NulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h62d3c8deb4a47d04E $_ZN57_$LT$core..str..Utf8Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h0736023f89ec8051E $_ZN4core3ptr13drop_in_place17h2bbaf394966f4871E $_ZN82_$LT$std..sys_common..poison..PoisonError$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h5133a11d5216d05aE $_ZN4core3ptr13drop_in_place17h286c4e66fba3710aE $_ZN3std5error5Error5cause17h940cb81d2ddff14fE $_ZN3std5error5Error7type_id17h2550ffb23e5e09dbE $_ZN3std5error5Error9backtrace17h900a267d2e29f61aE $_ZN243_$LT$std..error..$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..boxed..Box$LT$dyn$u20$std..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$..from..StringError$u20$as$u20$std..error..Error$GT$11description17hf458bce664dc3f4bE $_ZN244_$LT$std..error..$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..boxed..Box$LT$dyn$u20$std..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$..from..StringError$u20$as$u20$core..fmt..Display$GT$3fmt17h8f27cecacd89bd46E $_ZN242_$LT$std..error..$LT$impl$u20$core..convert..From$LT$alloc..string..String$GT$$u20$for$u20$alloc..boxed..Box$LT$dyn$u20$std..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$..from..StringError$u20$as$u20$core..fmt..Debug$GT$3fmt17hddb087305b783b60E $_ZN4core3ptr13drop_in_place17h031a203171380296E $_ZN80_$LT$std..io..Write..write_fmt..Adaptor$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hc2a4146e00a3c941E $_ZN4core3fmt5Write10write_char17hb53f5ebecc3ea1e8E $_ZN4core3fmt5Write9write_fmt17h742453284fe8e52bE $_ZN80_$LT$std..io..Write..write_fmt..Adaptor$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h612bf57410edd764E $_ZN4core3fmt5Write10write_char17h5ee09af859d49745E $_ZN4core3fmt5Write9write_fmt17h76d12290e419169eE $_ZN3std4sync4once4Once9call_once28_$u7b$$u7b$closure$u7d$$u7d$17h1a740cc3bed420c0E $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h0d04168c9cec80f1E $_ZN4core3ptr13drop_in_place17hea2daf7bfbdfa5f6E $_ZN3std10sys_common9backtrace10_print_fmt28_$u7b$$u7b$closure$u7d$$u7d$17hbd37bfd99643a95bE $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h2ca61fe20b181ea6E $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17hc0ad29c3b7e3386dE $_ZN60_$LT$std..io..stdio..StderrRaw$u20$as$u20$std..io..Write$GT$5write17h912c877745d11fe6E $_ZN3std2io5Write14write_vectored17ha0666460d161172dE $_ZN3std2io5Write17is_write_vectored17h543cbc50b0d68d7bE $_ZN59_$LT$std..process..ChildStdin$u20$as$u20$std..io..Write$GT$5flush17hd1cd00994c0d68a2E $_ZN3std2io5Write9write_all17h39d0435291d0ea60E $_ZN3std2io5Write18write_all_vectored17h937b0242149abcbeE $_ZN3std2io5Write9write_fmt17h509c48398dd5c56bE $_ZN4core3ptr13drop_in_place17he50565616af5671aE $_ZN3std2io5impls71_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..boxed..Box$LT$W$GT$$GT$5write17h6eb49032bb7d1e27E $_ZN3std2io5impls71_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..boxed..Box$LT$W$GT$$GT$14write_vectored17he5299a3cb28c5fc6E $_ZN3std2io5impls71_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..boxed..Box$LT$W$GT$$GT$17is_write_vectored17h3aebec87a302fb55E $_ZN3std2io5impls71_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..boxed..Box$LT$W$GT$$GT$5flush17h453d4cb3a98eec9bE $_ZN3std2io5impls71_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..boxed..Box$LT$W$GT$$GT$9write_all17h50557d4e500ea2b9E $_ZN3std2io5Write18write_all_vectored17h30c34f9cecddc9d3E $_ZN3std2io5impls71_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..boxed..Box$LT$W$GT$$GT$9write_fmt17h99e751738b71fff0E $_ZN4core3ptr13drop_in_place17ha21ac40875b3662cE $_ZN90_$LT$std..panicking..begin_panic_handler..PanicPayload$u20$as$u20$core..panic..BoxMeUp$GT$8take_box17h516f6ed2d13d495aE $_ZN90_$LT$std..panicking..begin_panic_handler..PanicPayload$u20$as$u20$core..panic..BoxMeUp$GT$3get17h0dcd379042aba638E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hf6b487e2f110a1d5E $_ZN91_$LT$std..panicking..begin_panic..PanicPayload$LT$A$GT$$u20$as$u20$core..panic..BoxMeUp$GT$8take_box17hf6fdacb60f80e8b3E $_ZN91_$LT$std..panicking..begin_panic..PanicPayload$LT$A$GT$$u20$as$u20$core..panic..BoxMeUp$GT$3get17h3853a323bdd12366E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h8ccad713f7bee105E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h4473b65edfd7c202E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h76450d0c1fa7b5b6E $_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h94ceed4e1d7d3c8dE $_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h3e5fc21d5d0a9a89E $_ZN4core3ops8function6FnOnce9call_once17hbe6f8b545009bafbE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h37140add365c2157E $_ZN4core3ptr13drop_in_place17h0204d3c859ff1c91E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hb45251ab3c3bdb48E $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h7d4360c25f7b0b1cE $_ZN4core3fmt5Write10write_char17h9446e22d80409ee0E $_ZN4core3fmt5Write9write_fmt17h6f04c3f5d7115a7dE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hcaf25e9d3ce3562aE $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17hb3f289137b2fd88fE $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h96c3b1b942e129b3E $_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hcaddaae78279c2cdE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h061cea3d0e32c42bE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h40152972685c8e83E)
  (data (;0;) (i32.const 1048576) "\01\00\00\00\04\00\00\00\04\00\00\00\02\00\00\00\02\00\00\00\03\00\00\00Hello, world!\0a\00\00\18\00\10\00\0e\00\00\00(\00\10\004\00\10\00\11\00\00\00\04\00\00\00\04\00\00\00\12\00\00\00\13\00\00\00\14\00\00\00\11\00\00\00\04\00\00\00\04\00\00\00\15\00\00\00\16\00\00\00\17\00\00\00\11\00\00\00\04\00\00\00\04\00\00\00\18\00\00\00\19\00\00\00\1a\00\00\00\11\00\00\00\04\00\00\00\04\00\00\00\1b\00\00\00/rustc/d3fb005a39e62501b8b0b356166e515ae24e2e54/src/libcore/macros/mod.rs\00\00\00\90\00\10\00I\00\00\00\0a\00\00\00\09\00\00\00already borrowed/rustc/d3fb005a39e62501b8b0b356166e515ae24e2e54/src/libcore/cell.rs\00\fc\00\10\00C\00\00\00m\03\00\00\09\00\00\00already mutably borrowed\fc\00\10\00C\00\00\00\1d\03\00\00\09\00\00\00assertion failed: `(left == right)`\0a  left: ``,\0a right: ``\00\00x\01\10\00-\00\00\00\a5\01\10\00\0c\00\00\00\b1\01\10\00\01\00\00\00\11\00\00\00\00\00\00\00\01\00\00\00\1c\00\00\00`: \00x\01\10\00-\00\00\00\a5\01\10\00\0c\00\00\00\dc\01\10\00\03\00\00\00called `Option::unwrap()` on a `None` value\00\11\00\00\00\00\00\00\00\01\00\00\00\1d\00\00\00\11\00\00\00\00\00\00\00\01\00\00\00\1e\00\00\00\1f\00\00\00\10\00\00\00\04\00\00\00 \00\00\00called `Result::unwrap()` on an `Err` value\00\11\00\00\00\08\00\00\00\04\00\00\00!\00\00\00\22\00\00\00\08\00\00\00\04\00\00\00#\00\00\00Tried to shrink to a larger capacity\11\00\00\00\04\00\00\00\04\00\00\00\07\00\00\00src/libstd/thread/mod.rs\d4\02\10\00\18\00\00\00\8a\03\00\00\11\00\00\00inconsistent park state\00\d4\02\10\00\18\00\00\00\98\03\00\00\13\00\00\00\02\00\00\00park state changed unexpectedly\00(\03\10\00\1f\00\00\00\d4\02\10\00\18\00\00\00\95\03\00\00\0d\00\00\00failed to generate unique thread ID: bitspace exhausted\00\d4\02\10\00\18\00\00\00.\04\00\00\11\00\00\00\d4\02\10\00\18\00\00\004\04\00\00\16\00\00\00thread name may not contain interior null bytes\00\d4\02\10\00\18\00\00\00w\04\00\00\1a\00\00\00inconsistent state in unpark\d4\02\10\00\18\00\00\00\af\04\00\00\12\00\00\00\d4\02\10\00\18\00\00\00\bd\04\00\00\0e\00\00\00\22RUST_BACKTRACE0src/libstd/env.rsfailed to get environment variable `\00\00\00U\04\10\00$\00\00\00\dc\01\10\00\03\00\00\00D\04\10\00\11\00\00\00\fb\00\00\00\1d\00\00\00$\00\00\00\0c\00\00\00\04\00\00\00%\00\00\00&\00\00\00'\00\00\00(\00\00\00%\00\00\00)\00\00\00*\00\00\00data provided contains a nul bytesrc/libstd/ffi/c_str.rs\e5\04\10\00\17\00\00\00\aa\04\00\00\0a\00\00\00src/libstd/io/buffered.rs\00\00\00\0c\05\10\00\19\00\00\00\10\02\00\00\15\00\00\00\0c\05\10\00\19\00\00\00\10\02\00\009\00\00\00failed to write the buffered data\00\00\00\0c\05\10\00\19\00\00\00J\02\00\00\09\00\00\00\0c\05\10\00\19\00\00\00\05\04\00\00#\00\00\00unexpected end of fileother os erroroperation interruptedwrite zerotimed outinvalid datainvalid input parameteroperation would blockentity already existsbroken pipeaddress not availableaddress in usenot connectedconnection abortedconnection resetconnection refusedpermission deniedentity not found\00\00\00\cc\01\10\00\00\00\00\00 (os error )\cc\01\10\00\00\00\00\00\c0\06\10\00\0b\00\00\00\cb\06\10\00\01\00\00\00failed to write whole buffersrc/libstd/io/stdio.rscannot access stdout during shutdown\00\00\00\07\10\00\16\00\00\00\0f\02\00\00\19\00\00\00failed printing to : \00\00\00L\07\10\00\13\00\00\00_\07\10\00\02\00\00\00\00\07\10\00\16\00\00\00n\03\00\00\09\00\00\00stdoutsrc/libstd/io/mod.rs\00\00\8a\07\10\00\14\00\00\00\84\04\00\00\19\00\00\00\8a\07\10\00\14\00\00\00}\05\00\00!\00\00\00+\00\00\00\0c\00\00\00\04\00\00\00,\00\00\00-\00\00\00.\00\00\00formatter error\00+\00\00\00\0c\00\00\00\04\00\00\00/\00\00\000\00\00\001\00\00\00attempted to use a condition variable with two mutexessrc/libstd/sync/condvar.rs6\08\10\00\1a\00\00\00?\02\00\00\12\00\00\00\11\00\00\00\04\00\00\00\04\00\00\002\00\00\003\00\00\00src/libstd/sync/once.rs\00t\08\10\00\17\00\00\00\08\01\00\00)\00\00\00assertion failed: state_and_queue & STATE_MASK == RUNNING\00\00\00t\08\10\00\17\00\00\00\a7\01\00\00\15\00\00\00Once instance has previously been poisoned\00\00t\08\10\00\17\00\00\00\8b\01\00\00\15\00\00\00t\08\10\00\17\00\00\00\e8\01\00\00\09\00\00\00t\08\10\00\17\00\00\00\f4\01\00\00\1e\00\00\00assertion failed: queue != DONEsrc/libstd/sys_common/at_exit_imp.rs\00c\09\10\00$\00\00\001\00\00\00\0d\00\00\00stack backtrace:\0a\00\00\00\98\09\10\00\11\00\00\004\00\00\00\10\00\00\00\04\00\00\005\00\00\006\00\00\00note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.\0a\c8\09\10\00X\00\00\00full<unknown>\5cx\005\0a\10\00\02\00\00\00\00\00\00\00 \00\00\00\08\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\03\00\00\00PoisonError { inner: .. }src/libstd/sys_common/thread_info.rsassertion failed: c.borrow().is_none()\00y\0a\10\00$\00\00\00(\00\00\00\1a\00\00\00fatal runtime error: \0a\00\00\d4\0a\10\00\15\00\00\00\e9\0a\10\00\01\00\00\00\11\00\00\00\04\00\00\00\04\00\00\007\00\00\00memory allocation of  bytes failed\00\00\0c\0b\10\00\15\00\00\00!\0b\10\00\0d\00\00\00src/libstd/panicking.rs\00@\0b\10\00\17\00\00\00\b4\00\00\00\14\00\00\00Box<Any><unnamed>\00\00\00\11\00\00\00\00\00\00\00\01\00\00\008\00\00\009\00\00\00:\00\00\00;\00\00\00<\00\00\00=\00\00\00>\00\00\00\00\00\00\00?\00\00\00\08\00\00\00\04\00\00\00@\00\00\00A\00\00\00B\00\00\00C\00\00\00D\00\00\00E\00\00\00F\00\00\00\00\00\00\00thread '' panicked at '', \00\00\d4\0b\10\00\08\00\00\00\dc\0b\10\00\0f\00\00\00\eb\0b\10\00\03\00\00\00\e9\0a\10\00\01\00\00\00note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace\0a\00\00\10\0c\10\00N\00\00\00@\0b\10\00\17\00\00\00\82\01\00\00\0f\00\00\00@\0b\10\00\17\00\00\00\83\01\00\00\0f\00\00\00G\00\00\00\10\00\00\00\04\00\00\00H\00\00\00I\00\00\00$\00\00\00\0c\00\00\00\04\00\00\00J\00\00\00\11\00\00\00\08\00\00\00\04\00\00\00K\00\00\00L\00\00\00\11\00\00\00\08\00\00\00\04\00\00\00M\00\00\00thread panicked while processing panic. aborting.\0a\00\00\d0\0c\10\002\00\00\00thread panicked while panicking. aborting.\0a\00\0c\0d\10\00+\00\00\00failed to initiate panic, error @\0d\10\00 \00\00\00NulError\11\00\00\00\04\00\00\00\04\00\00\00N\00\00\00can't block with web assemblysrc/libstd/sys/wasi/../wasm/condvar.rs\00\9d\0d\10\00&\00\00\00\15\00\00\00\09\00\00\00advancing IoSlice beyond its lengthsrc/libstd/sys/wasi/io.rs\f7\0d\10\00\19\00\00\00\14\00\00\00\0d\00\00\00cannot recursively acquire mutexsrc/libstd/sys/wasi/../wasm/mutex.rs@\0e\10\00$\00\00\00\15\00\00\00\09\00\00\00strerror_r failuresrc/libstd/sys/wasi/os.rs\00\86\0e\10\00\19\00\00\00#\00\00\00\0d\00\00\00\86\0e\10\00\19\00\00\00%\00\00\00\09\00\00\00rwlock locked for writing\00\00\00\c0\0e\10\00\19\00\00\00operation not supported on wasm yet\00\00\00\00\00\00\00\00\00\00\19\12D;\02?,G\14=30\0a\1b\06FKE7\0fI\0e\17\03@\1d<+6\1fJ-\1c\01 %)!\08\0c\15\16\22.\108>\0b41\18/A\099\11#C2B:\05\04&('\0d*\1e5\07\1aH\13$L\ff\00\00Success\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Previous owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Link has been severed\00Protocol error\00Bad message\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Operation already in progress\00Operation in progress\00Stale file handle\00Quota exceeded\00Multihop attempted\00Capabilities insufficient\00No error information\00\00src/liballoc/raw_vec.rscapacity overflow\00\00\86\15\10\00\17\00\00\00D\02\00\00\05\00\00\00)src/liballoc/vec.rs) should be <= len (is end drain index (is \00\eb\15\10\00\14\00\00\00\d4\15\10\00\17\00\00\00\c0\15\10\00\01\00\00\00\c1\15\10\00\13\00\00\003\05\00\00\0d\00\00\00`\00..*\16\10\00\02\00\00\00BorrowErrorBorrowMutErrorcalled `Option::unwrap()` on a `None` value(\16\10\00\00\00\00\00: \00\00(\16\10\00\00\00\00\00\80\16\10\00\02\00\00\00T\00\00\00\00\00\00\00\01\00\00\00U\00\00\00:\00\00\00(\16\10\00\00\00\00\00\a4\16\10\00\01\00\00\00\a4\16\10\00\01\00\00\00index out of bounds: the len is  but the index is \00\00\c0\16\10\00 \00\00\00\e0\16\10\00\12\00\00\00T\00\00\00\0c\00\00\00\04\00\00\00V\00\00\00W\00\00\00X\00\00\00     {\0a,\0a,  { } }(\0a(,)\0a[T\00\00\00\04\00\00\00\04\00\00\00Y\00\00\00]src/libcore/fmt/num.rs\00E\17\10\00\16\00\00\00T\00\00\00\14\00\00\000x00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899\00\00T\00\00\00\04\00\00\00\04\00\00\00Z\00\00\00[\00\00\00\5c\00\00\00src/libcore/fmt/mod.rs\00\00P\18\10\00\16\00\00\00S\04\00\00\11\00\00\00P\18\10\00\16\00\00\00]\04\00\00$\00\00\00src/libcore/slice/memchr.rs\00\88\18\10\00\1b\00\00\00R\00\00\00\05\00\00\00\88\18\10\00\1b\00\00\00i\00\00\00\1a\00\00\00\88\18\10\00\1b\00\00\00\83\00\00\00\05\00\00\00index  out of range for slice of length \d4\18\10\00\06\00\00\00\da\18\10\00\22\00\00\00slice index starts at  but ends at \00\0c\19\10\00\16\00\00\00\22\19\10\00\0d\00\00\00attempted to index slice up to maximum usizesrc/libcore/str/pattern.rs\00\00l\19\10\00\1a\00\00\00\8b\01\00\00&\00\00\00src/libcore/str/lossy.rs\98\19\10\00\18\00\00\00\80\00\00\00\19\00\00\00\98\19\10\00\18\00\00\00w\00\00\00\1d\00\00\00\98\19\10\00\18\00\00\00{\00\00\00\1d\00\00\00\98\19\10\00\18\00\00\00r\00\00\00!\00\00\00\98\19\10\00\18\00\00\00h\00\00\00\1d\00\00\00\98\19\10\00\18\00\00\00c\00\00\00!\00\00\00\98\19\10\00\18\00\00\00X\00\00\00\1d\00\00\00assertion failed: broken.is_empty()\00\98\19\10\00\18\00\00\00\9d\00\00\00\11\00\00\00src/libcore/str/mod.rs\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\04\04\04\04\04\00\00\00\00\00\00\00\00\00\00\00\00\00T\1a\10\00\16\00\00\00\80\07\00\00/\00\00\00T\1a\10\00\16\00\00\00\c3\07\00\00/\00\00\00T\1a\10\00\16\00\00\00\04\08\00\00/\00\00\00[...]byte index  is out of bounds of `\00\00\a1\1b\10\00\0b\00\00\00\ac\1b\10\00\16\00\00\00(\16\10\00\01\00\00\00begin <= end ( <= ) when slicing `\00\00\dc\1b\10\00\0e\00\00\00\ea\1b\10\00\04\00\00\00\ee\1b\10\00\10\00\00\00(\16\10\00\01\00\00\00 is not a char boundary; it is inside  (bytes ) of `\a1\1b\10\00\0b\00\00\00 \1c\10\00&\00\00\00F\1c\10\00\08\00\00\00N\1c\10\00\06\00\00\00(\16\10\00\01\00\00\00src/libcore/unicode/printable.rs|\1c\10\00 \00\00\00\0a\00\00\00\1c\00\00\00|\1c\10\00 \00\00\00\1a\00\00\00(\00\00\00\00\01\03\05\05\06\06\03\07\06\08\08\09\11\0a\1c\0b\19\0c\14\0d\10\0e\0d\0f\04\10\03\12\12\13\09\16\01\17\05\18\02\19\03\1a\07\1c\02\1d\01\1f\16 \03+\03,\02-\0b.\010\031\022\01\a7\02\a9\02\aa\04\ab\08\fa\02\fb\05\fd\04\fe\03\ff\09\adxy\8b\8d\a20WX\8b\8c\90\1c\1d\dd\0e\0fKL\fb\fc./?\5c]_\b5\e2\84\8d\8e\91\92\a9\b1\ba\bb\c5\c6\c9\ca\de\e4\e5\ff\00\04\11\12)147:;=IJ]\84\8e\92\a9\b1\b4\ba\bb\c6\ca\ce\cf\e4\e5\00\04\0d\0e\11\12)14:;EFIJ^de\84\91\9b\9d\c9\ce\cf\0d\11)EIWde\8d\91\a9\b4\ba\bb\c5\c9\df\e4\e5\f0\0d\11EIde\80\84\b2\bc\be\bf\d5\d7\f0\f1\83\85\8b\a4\a6\be\bf\c5\c7\ce\cf\da\dbH\98\bd\cd\c6\ce\cfINOWY^_\89\8e\8f\b1\b6\b7\bf\c1\c6\c7\d7\11\16\17[\5c\f6\f7\fe\ff\80\0dmq\de\df\0e\0f\1fno\1c\1d_}~\ae\af\bb\bc\fa\16\17\1e\1fFGNOXZ\5c^~\7f\b5\c5\d4\d5\dc\f0\f1\f5rs\8ftu\96/_&./\a7\af\b7\bf\c7\cf\d7\df\9a@\97\980\8f\1f\c0\c1\ce\ffNOZ[\07\08\0f\10'/\ee\efno7=?BE\90\91\fe\ffSgu\c8\c9\d0\d1\d8\d9\e7\fe\ff\00 _\22\82\df\04\82D\08\1b\04\06\11\81\ac\0e\80\ab5(\0b\80\e0\03\19\08\01\04/\044\04\07\03\01\07\06\07\11\0aP\0f\12\07U\07\03\04\1c\0a\09\03\08\03\07\03\02\03\03\03\0c\04\05\03\0b\06\01\0e\15\05:\03\11\07\06\05\10\07W\07\02\07\15\0dP\04C\03-\03\01\04\11\06\0f\0c:\04\1d%_ m\04j%\80\c8\05\82\b0\03\1a\06\82\fd\03Y\07\15\0b\17\09\14\0c\14\0cj\06\0a\06\1a\06Y\07+\05F\0a,\04\0c\04\01\031\0b,\04\1a\06\0b\03\80\ac\06\0a\06!?L\04-\03t\08<\03\0f\03<\078\08+\05\82\ff\11\18\08/\11-\03 \10!\0f\80\8c\04\82\97\19\0b\15\88\94\05/\05;\07\02\0e\18\09\80\b3-t\0c\80\d6\1a\0c\05\80\ff\05\80\df\0c\ee\0d\03\84\8d\037\09\81\5c\14\80\b8\08\80\cb*8\03\0a\068\08F\08\0c\06t\0b\1e\03Z\04Y\09\80\83\18\1c\0a\16\09L\04\80\8a\06\ab\a4\0c\17\041\a1\04\81\da&\07\0c\05\05\80\a5\11\81m\10x(*\06L\04\80\8d\04\80\be\03\1b\03\0f\0d\00\06\01\01\03\01\04\02\08\08\09\02\0a\05\0b\02\0e\04\10\01\11\02\12\05\13\11\14\01\15\02\17\02\19\0d\1c\05\1d\08$\01j\03k\02\bc\02\d1\02\d4\0c\d5\09\d6\02\d7\02\da\01\e0\05\e1\02\e8\02\ee \f0\04\f8\02\f9\02\fa\02\fb\01\0c';>NO\8f\9e\9e\9f\06\07\096=>V\f3\d0\d1\04\14\1867VW\7f\aa\ae\af\bd5\e0\12\87\89\8e\9e\04\0d\0e\11\12)14:EFIJNOde\5c\b6\b7\1b\1c\07\08\0a\0b\14\1769:\a8\a9\d8\d9\097\90\91\a8\07\0a;>fi\8f\92o_\ee\efZb\9a\9b'(U\9d\a0\a1\a3\a4\a7\a8\ad\ba\bc\c4\06\0b\0c\15\1d:?EQ\a6\a7\cc\cd\a0\07\19\1a\22%>?\c5\c6\04 #%&(38:HJLPSUVXZ\5c^`cefksx}\7f\8a\a4\aa\af\b0\c0\d0\ae\afy\ccno\93^\22{\05\03\04-\03f\03\01/.\80\82\1d\031\0f\1c\04$\09\1e\05+\05D\04\0e*\80\aa\06$\04$\04(\084\0b\01\80\90\817\09\16\0a\08\80\989\03c\08\090\16\05!\03\1b\05\01@8\04K\05/\04\0a\07\09\07@ '\04\0c\096\03:\05\1a\07\04\0c\07PI73\0d3\07.\08\0a\81&RN(\08*V\1c\14\17\09N\04\1e\0fC\0e\19\07\0a\06H\08'\09u\0b?A*\06;\05\0a\06Q\06\01\05\10\03\05\80\8bb\1eH\08\0a\80\a6^\22E\0b\0a\06\0d\139\07\0a6,\04\10\80\c0<dS\0cH\09\0aFE\1bH\08S\1d9\81\07F\0a\1d\03GI7\03\0e\08\0a\069\07\0a\816\19\80\b7\01\0f2\0d\83\9bfu\0b\80\c4\8a\bc\84/\8f\d1\82G\a1\b9\829\07*\04\02`&\0aF\0a(\05\13\82\b0[eK\049\07\11@\05\0b\02\0e\97\f8\08\84\d6*\09\a2\f7\81\1f1\03\11\04\08\81\8c\89\04k\05\0d\03\09\07\10\93`\80\f6\0as\08n\17F\80\9a\14\0cW\09\19\80\87\81G\03\85B\0f\15\85P+\80\d5-\03\1a\04\02\81p:\05\01\85\00\80\d7)L\04\0a\04\02\83\11DL=\80\c2<\06\01\04U\05\1b4\02\81\0e,\04d\0cV\0a\80\ae8\1d\0d,\04\09\07\02\0e\06\80\9a\83\d8\08\0d\03\0d\03t\0cY\07\0c\14\0c\048\08\0a\06(\08\22N\81T\0c\15\03\03\05\07\09\19\07\07\09\03\0d\07)\80\cb%\0a\84\06src/libcore/unicode/unicode_data.rs\00\00\03\22\10\00#\00\00\00K\00\00\00(\00\00\00\03\22\10\00#\00\00\00W\00\00\00\16\00\00\00\03\22\10\00#\00\00\00R\00\00\00>\00\00\00T\00\00\00\04\00\00\00\04\00\00\00]\00\00\00SomeNoneUtf8Errorvalid_up_toerror_len\00\00\00T\00\00\00\04\00\00\00\04\00\00\00^\00\00\00\00\03\00\00\83\04 \00\91\05`\00]\13\a0\00\12\17\a0\1e\0c \e0\1e\ef, +*0\a0+o\a6`,\02\a8\e0,\1e\fb\e0-\00\fe\a05\9e\ff\e05\fd\01a6\01\0a\a16$\0da7\ab\0e\e18/\18!90\1caF\f3\1e\a1J\f0jaNOo\a1N\9d\bc!Oe\d1\e1O\00\da!P\00\e0\e1Q0\e1aS\ec\e2\a1T\d0\e8\e1T \00.U\f0\01\bfU\00p\00\07\00-\01\01\01\02\01\02\01\01H\0b0\15\10\01e\07\02\06\02\02\01\04#\01\1e\1b[\0b:\09\09\01\18\04\01\09\01\03\01\05+\03w\0f\01 7\01\01\01\04\08\04\01\03\07\0a\02\1d\01:\01\01\01\02\04\08\01\09\01\0a\02\1a\01\02\029\01\04\02\04\02\02\03\03\01\1e\02\03\01\0b\029\01\04\05\01\02\04\01\14\02\16\06\01\01:\01\01\02\01\04\08\01\07\03\0a\02\1e\01;\01\01\01\0c\01\09\01(\01\03\019\03\05\03\01\04\07\02\0b\02\1d\01:\01\02\01\02\01\03\01\05\02\07\02\0b\02\1c\029\02\01\01\02\04\08\01\09\01\0a\02\1d\01H\01\04\01\02\03\01\01\08\01Q\01\02\07\0c\08b\01\02\09\0b\06J\02\1b\01\01\01\01\017\0e\01\05\01\02\05\0b\01$\09\01f\04\01\06\01\02\02\02\19\02\04\03\10\04\0d\01\02\02\06\01\0f\01\00\03\00\03\1d\03\1d\02\1e\02@\02\01\07\08\01\02\0b\09\01-\03w\02\22\01v\03\04\02\09\01\06\03\db\02\02\01:\01\01\07\01\01\01\01\02\08\06\0a\02\010\11?\040\07\01\01\05\01(\09\0c\02 \04\02\02\01\038\01\01\02\03\01\01\03:\08\02\02\98\03\01\0d\01\07\04\01\06\01\03\02\c6:\01\05\00\01\c3!\00\03\8d\01` \00\06i\02\00\04\01\0a \02P\02\00\01\03\01\04\01\19\02\05\01\97\02\1a\12\0d\01&\08\19\0b.\030\01\02\04\02\02'\01C\06\02\02\02\02\0c\01\08\01/\013\01\01\03\02\02\05\02\01\01*\02\08\01\ee\01\02\01\04\01\00\01\00\10\10\10\00\02\00\01\e2\01\95\05\00\03\01\02\05\04(\03\04\01\a5\02\00\04\00\02\99\0b\b0\016\0f8\031\04\02\02E\03$\05\01\08>\01\0c\024\09\0a\04\02\01_\03\02\01\01\02\06\01\a0\01\03\08\15\029\02\01\01\01\01\16\01\0e\07\03\05\c3\08\02\03\01\01\17\01Q\01\02\06\01\01\02\01\01\02\01\02\eb\01\02\04\06\02\01\02\1b\02U\08\02\01\01\02j\01\01\01\02\06\01\01e\03\02\04\01\05\00\09\01\02\f5\01\0a\02\01\01\04\01\90\04\02\02\04\01 \0a(\06\02\04\08\01\09\06\02\03.\0d\01\02\00\07\01\06\01\01R\16\02\07\01\02\01\02z\06\03\01\01\02\01\07\01\01H\02\03\01\01\01\00\02\00\05;\07\00\01?\04Q\01\00\02\00\01\01\03\04\05\08\08\02\07\1e\04\94\03\007\042\08\01\0e\01\16\05\01\0f\00\07\01\11\02\07\01\02\01\05\00\07\00\04\00\07m\07\00`\80\f0\00")
  (data (;1;) (i32.const 1058256) "\01\00\00\00\00\00\00\00\01"))
