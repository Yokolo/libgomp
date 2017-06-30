! include/45/omp_lib.f.var

! <copyright>
!    Copyright (c) 1985-2016 Intel Corporation.  All Rights Reserved.
!
!    Redistribution and use in source and binary forms, with or without
!    modification, are permitted provided that the following conditions
!    are met:
!
!      * Redistributions of source code must retain the above copyright
!        notice, this list of conditions and the following disclaimer.
!      * Redistributions in binary form must reproduce the above copyright
!        notice, this list of conditions and the following disclaimer in the
!        documentation and/or other materials provided with the distribution.
!      * Neither the name of Intel Corporation nor the names of its
!        contributors may be used to endorse or promote products derived
!        from this software without specific prior written permission.
!
!    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
!    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
!    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
!    A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
!    HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
!    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
!    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
!    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
!    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
!    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
!    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
!
! </copyright>

!***
!*** Some of the directives for the following routine extend past column 72,
!*** so process this file in 132-column mode.
!***

!dec$ fixedformlinesize:132

      module omp_lib_kinds

        integer, parameter :: omp_integer_kind       = 4
        integer, parameter :: omp_logical_kind       = 4
        integer, parameter :: omp_real_kind          = 4
        integer, parameter :: omp_lock_kind          = int_ptr_kind()
        integer, parameter :: omp_nest_lock_kind     = int_ptr_kind()
        integer, parameter :: omp_sched_kind         = omp_integer_kind
        integer, parameter :: omp_proc_bind_kind     = omp_integer_kind
        integer, parameter :: kmp_pointer_kind       = int_ptr_kind()
        integer, parameter :: kmp_size_t_kind        = int_ptr_kind()
        integer, parameter :: kmp_affinity_mask_kind = int_ptr_kind()
        integer, parameter :: kmp_cancel_kind        = omp_integer_kind
        integer, parameter :: omp_lock_hint_kind     = omp_integer_kind

      end module omp_lib_kinds

      module omp_lib

        use omp_lib_kinds

        integer (kind=omp_integer_kind), parameter :: kmp_version_major = 5
        integer (kind=omp_integer_kind), parameter :: kmp_version_minor = 0
        integer (kind=omp_integer_kind), parameter :: kmp_version_build = 20160808
        character(*), parameter :: kmp_build_date    = '2017-06-02 14:54:15 UTC'
        integer (kind=omp_integer_kind), parameter :: openmp_version    = 200505

        integer(kind=omp_sched_kind), parameter :: omp_sched_static  = 1
        integer(kind=omp_sched_kind), parameter :: omp_sched_dynamic = 2
        integer(kind=omp_sched_kind), parameter :: omp_sched_guided  = 3
        integer(kind=omp_sched_kind), parameter :: omp_sched_auto    = 4

        integer (kind=omp_proc_bind_kind), parameter :: omp_proc_bind_false = 0
        integer (kind=omp_proc_bind_kind), parameter :: omp_proc_bind_true = 1
        integer (kind=omp_proc_bind_kind), parameter :: omp_proc_bind_master = 2
        integer (kind=omp_proc_bind_kind), parameter :: omp_proc_bind_close = 3
        integer (kind=omp_proc_bind_kind), parameter :: omp_proc_bind_spread = 4

        integer (kind=kmp_cancel_kind), parameter :: kmp_cancel_parallel = 1
        integer (kind=kmp_cancel_kind), parameter :: kmp_cancel_loop = 2
        integer (kind=kmp_cancel_kind), parameter :: kmp_cancel_sections = 3
        integer (kind=kmp_cancel_kind), parameter :: kmp_cancel_taskgroup = 4

        integer (kind=omp_lock_hint_kind), parameter :: omp_lock_hint_none           = 0
        integer (kind=omp_lock_hint_kind), parameter :: omp_lock_hint_uncontended    = 1
        integer (kind=omp_lock_hint_kind), parameter :: omp_lock_hint_contended      = 2
        integer (kind=omp_lock_hint_kind), parameter :: omp_lock_hint_nonspeculative = 4
        integer (kind=omp_lock_hint_kind), parameter :: omp_lock_hint_speculative    = 8
        integer (kind=omp_lock_hint_kind), parameter :: kmp_lock_hint_hle            = 65536
        integer (kind=omp_lock_hint_kind), parameter :: kmp_lock_hint_rtm            = 131072
        integer (kind=omp_lock_hint_kind), parameter :: kmp_lock_hint_adaptive       = 262144

        interface

!         ***
!         *** omp_* entry points
!         ***

          subroutine omp_set_num_threads(nthreads)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) nthreads
          end subroutine omp_set_num_threads

          subroutine omp_set_dynamic(enable)
            use omp_lib_kinds
            logical (kind=omp_logical_kind) enable
          end subroutine omp_set_dynamic

          subroutine omp_set_nested(enable)
            use omp_lib_kinds
            logical (kind=omp_logical_kind) enable
          end subroutine omp_set_nested

          function omp_get_num_threads()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_num_threads
          end function omp_get_num_threads

          function omp_get_max_threads()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_max_threads
          end function omp_get_max_threads

          function omp_get_thread_num()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_thread_num
          end function omp_get_thread_num

          function omp_get_num_procs()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_num_procs
          end function omp_get_num_procs

          function omp_in_parallel()
            use omp_lib_kinds
            logical (kind=omp_logical_kind) omp_in_parallel
          end function omp_in_parallel

          function omp_get_dynamic()
            use omp_lib_kinds
            logical (kind=omp_logical_kind) omp_get_dynamic
          end function omp_get_dynamic

          function omp_get_nested()
            use omp_lib_kinds
            logical (kind=omp_logical_kind) omp_get_nested
          end function omp_get_nested

          function omp_get_thread_limit()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_thread_limit
          end function omp_get_thread_limit

          subroutine omp_set_max_active_levels(max_levels)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) max_levels
          end subroutine omp_set_max_active_levels

          function omp_get_max_active_levels()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_max_active_levels
          end function omp_get_max_active_levels

          function omp_get_level()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_level
          end function omp_get_level

          function omp_get_active_level()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_active_level
          end function omp_get_active_level

          function omp_get_ancestor_thread_num(level)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) level
            integer (kind=omp_integer_kind) omp_get_ancestor_thread_num
          end function omp_get_ancestor_thread_num

          function omp_get_team_size(level)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) level
            integer (kind=omp_integer_kind) omp_get_team_size
          end function omp_get_team_size

          subroutine omp_set_schedule(kind, modifier)
            use omp_lib_kinds
            integer (kind=omp_sched_kind) kind
            integer (kind=omp_integer_kind) modifier
          end subroutine omp_set_schedule

          subroutine omp_get_schedule(kind, modifier)
            use omp_lib_kinds
            integer (kind=omp_sched_kind) kind
            integer (kind=omp_integer_kind) modifier
          end subroutine omp_get_schedule

          subroutine omp_set_workload(kind, modifier)
            use omp_lib_kinds
            integer (kind=kmp_pointer_kind) value::kind
            integer (kind=omp_integer_kind) value::modifier
          end subroutine omp_set_workload

          function omp_get_proc_bind()
            use omp_lib_kinds
            integer (kind=omp_proc_bind_kind) omp_get_proc_bind
          end function omp_get_proc_bind

          function omp_get_num_places()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_num_places
          end function omp_get_num_places

          function omp_get_place_num_procs(place_num)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) place_num
            integer (kind=omp_integer_kind) omp_get_place_num_procs
          end function omp_get_place_num_procs

          subroutine omp_get_place_proc_ids(place_num, ids)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) place_num
            integer (kind=kmp_pointer_kind) ids
          end subroutine omp_get_place_proc_ids

          function omp_get_place_num()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_place_num
          end function omp_get_place_num

          function omp_get_partition_num_places()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_partition_num_places
          end function omp_get_partition_num_places

          subroutine omp_get_partition_place_nums(place_nums)
            use omp_lib_kinds
            integer (kind=kmp_pointer_kind) place_nums
          end subroutine omp_get_partition_place_nums

          function omp_get_wtime()
            double precision omp_get_wtime
          end function omp_get_wtime

          function omp_get_wtick ()
            double precision omp_get_wtick
          end function omp_get_wtick

          function omp_get_default_device()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_default_device
          end function omp_get_default_device

          subroutine omp_set_default_device(dflt_device)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) dflt_device
          end subroutine omp_set_default_device

          function omp_get_num_devices()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_num_devices
          end function omp_get_num_devices

          function omp_get_num_teams()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_num_teams
          end function omp_get_num_teams

          function omp_get_team_num()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_team_num
          end function omp_get_team_num

          function omp_get_cancellation()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_cancellation
          end function omp_get_cancellation

          function omp_is_initial_device()
            use omp_lib_kinds
            logical (kind=omp_logical_kind) omp_is_initial_device
          end function omp_is_initial_device

          subroutine omp_init_lock(lockvar)
!DIR$ IF(__INTEL_COMPILER.GE.1400)
!DIR$ attributes known_intrinsic :: omp_init_lock
!DIR$ ENDIF
            use omp_lib_kinds
            integer (kind=omp_lock_kind) lockvar
          end subroutine omp_init_lock

          subroutine omp_destroy_lock(lockvar)
!DIR$ IF(__INTEL_COMPILER.GE.1400)
!DIR$ attributes known_intrinsic :: omp_destroy_lock
!DIR$ ENDIF
            use omp_lib_kinds
            integer (kind=omp_lock_kind) lockvar
          end subroutine omp_destroy_lock

          subroutine omp_set_lock(lockvar)
!DIR$ IF(__INTEL_COMPILER.GE.1400)
!DIR$ attributes known_intrinsic :: omp_set_lock
!DIR$ ENDIF
            use omp_lib_kinds
            integer (kind=omp_lock_kind) lockvar
          end subroutine omp_set_lock

          subroutine omp_unset_lock(lockvar)
!DIR$ IF(__INTEL_COMPILER.GE.1400)
!DIR$ attributes known_intrinsic :: omp_unset_lock
!DIR$ ENDIF
            use omp_lib_kinds
            integer (kind=omp_lock_kind) lockvar
          end subroutine omp_unset_lock

          function omp_test_lock(lockvar)
!DIR$ IF(__INTEL_COMPILER.GE.1400)
!DIR$ attributes known_intrinsic :: omp_test_lock
!DIR$ ENDIF
            use omp_lib_kinds
            logical (kind=omp_logical_kind) omp_test_lock
            integer (kind=omp_lock_kind) lockvar
          end function omp_test_lock

          subroutine omp_init_nest_lock(lockvar)
!DIR$ IF(__INTEL_COMPILER.GE.1400)
!DIR$ attributes known_intrinsic :: omp_init_nest_lock
!DIR$ ENDIF
            use omp_lib_kinds
            integer (kind=omp_nest_lock_kind) lockvar
          end subroutine omp_init_nest_lock

          subroutine omp_destroy_nest_lock(lockvar)
!DIR$ IF(__INTEL_COMPILER.GE.1400)
!DIR$ attributes known_intrinsic :: omp_destroy_nest_lock
!DIR$ ENDIF
            use omp_lib_kinds
            integer (kind=omp_nest_lock_kind) lockvar
          end subroutine omp_destroy_nest_lock

          subroutine omp_set_nest_lock(lockvar)
!DIR$ IF(__INTEL_COMPILER.GE.1400)
!DIR$ attributes known_intrinsic :: omp_set_nest_lock
!DIR$ ENDIF
            use omp_lib_kinds
            integer (kind=omp_nest_lock_kind) lockvar
          end subroutine omp_set_nest_lock

          subroutine omp_unset_nest_lock(lockvar)
!DIR$ IF(__INTEL_COMPILER.GE.1400)
!DIR$ attributes known_intrinsic :: omp_unset_nest_lock
!DIR$ ENDIF
            use omp_lib_kinds
            integer (kind=omp_nest_lock_kind) lockvar
          end subroutine omp_unset_nest_lock

          function omp_test_nest_lock(lockvar)
!DIR$ IF(__INTEL_COMPILER.GE.1400)
!DIR$ attributes known_intrinsic :: omp_test_nest_lock
!DIR$ ENDIF
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_test_nest_lock
            integer (kind=omp_nest_lock_kind) lockvar
          end function omp_test_nest_lock

          function omp_get_max_task_priority()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) omp_get_max_task_priority
          end function omp_get_max_task_priority

!         ***
!         *** kmp_* entry points
!         ***

          subroutine kmp_set_stacksize(size)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) size
          end subroutine kmp_set_stacksize

          subroutine kmp_set_stacksize_s(size)
            use omp_lib_kinds
            integer (kind=kmp_size_t_kind) size
          end subroutine kmp_set_stacksize_s

          subroutine kmp_set_blocktime(msec)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) msec
          end subroutine kmp_set_blocktime

          subroutine kmp_set_library_serial()
          end subroutine kmp_set_library_serial

          subroutine kmp_set_library_turnaround()
          end subroutine kmp_set_library_turnaround

          subroutine kmp_set_library_throughput()
          end subroutine kmp_set_library_throughput

          subroutine kmp_set_library(libnum)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) libnum
          end subroutine kmp_set_library

          subroutine kmp_set_defaults(string)
            character*(*) string
          end subroutine kmp_set_defaults

          function kmp_get_stacksize()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) kmp_get_stacksize
          end function kmp_get_stacksize

          function kmp_get_stacksize_s()
            use omp_lib_kinds
            integer (kind=kmp_size_t_kind) kmp_get_stacksize_s
          end function kmp_get_stacksize_s

          function kmp_get_blocktime()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) kmp_get_blocktime
          end function kmp_get_blocktime

          function kmp_get_library()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) kmp_get_library
          end function kmp_get_library

          function kmp_set_affinity(mask)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) kmp_set_affinity
            integer (kind=kmp_affinity_mask_kind) mask
          end function kmp_set_affinity

          function kmp_get_affinity(mask)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) kmp_get_affinity
            integer (kind=kmp_affinity_mask_kind) mask
          end function kmp_get_affinity

          function kmp_get_affinity_max_proc()
            use omp_lib_kinds
            integer (kind=omp_integer_kind) kmp_get_affinity_max_proc
          end function kmp_get_affinity_max_proc

          subroutine kmp_create_affinity_mask(mask)
            use omp_lib_kinds
            integer (kind=kmp_affinity_mask_kind) mask
          end subroutine kmp_create_affinity_mask

          subroutine kmp_destroy_affinity_mask(mask)
            use omp_lib_kinds
            integer (kind=kmp_affinity_mask_kind) mask
          end subroutine kmp_destroy_affinity_mask

          function kmp_set_affinity_mask_proc(proc, mask)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) kmp_set_affinity_mask_proc
            integer (kind=omp_integer_kind) proc
            integer (kind=kmp_affinity_mask_kind) mask
          end function kmp_set_affinity_mask_proc

          function kmp_unset_affinity_mask_proc(proc, mask)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) kmp_unset_affinity_mask_proc
            integer (kind=omp_integer_kind) proc
            integer (kind=kmp_affinity_mask_kind) mask
          end function kmp_unset_affinity_mask_proc

          function kmp_get_affinity_mask_proc(proc, mask)
            use omp_lib_kinds
            integer (kind=omp_integer_kind) kmp_get_affinity_mask_proc
            integer (kind=omp_integer_kind) proc
            integer (kind=kmp_affinity_mask_kind) mask
          end function kmp_get_affinity_mask_proc

          function kmp_malloc(size)
            use omp_lib_kinds
            integer (kind=kmp_pointer_kind) kmp_malloc
            integer (kind=kmp_size_t_kind) size
          end function kmp_malloc

          function kmp_aligned_malloc(size, alignment)
            use omp_lib_kinds
            integer (kind=kmp_pointer_kind) kmp_aligned_malloc
            integer (kind=kmp_size_t_kind) size
            integer (kind=kmp_size_t_kind) alignment
          end function kmp_aligned_malloc

          function kmp_calloc(nelem, elsize)
            use omp_lib_kinds
            integer (kind=kmp_pointer_kind) kmp_calloc
            integer (kind=kmp_size_t_kind) nelem
            integer (kind=kmp_size_t_kind) elsize
          end function kmp_calloc

          function kmp_realloc(ptr, size)
            use omp_lib_kinds
            integer (kind=kmp_pointer_kind) kmp_realloc
            integer (kind=kmp_pointer_kind) ptr
            integer (kind=kmp_size_t_kind) size
          end function kmp_realloc

          subroutine kmp_free(ptr)
            use omp_lib_kinds
            integer (kind=kmp_pointer_kind) ptr
          end subroutine kmp_free

          subroutine kmp_set_warnings_on()
          end subroutine kmp_set_warnings_on

          subroutine kmp_set_warnings_off()
          end subroutine kmp_set_warnings_off

          function kmp_get_cancellation_status(cancelkind)
            use omp_lib_kinds
            integer (kind=kmp_cancel_kind) cancelkind
            logical (kind=omp_logical_kind) kmp_get_cancellation_status
          end function kmp_get_cancellation_status

          subroutine kmp_init_lock_with_hint(lockvar, lockhint)
            use omp_lib_kinds
            integer (kind=omp_lock_kind) lockvar
            integer (kind=omp_lock_hint_kind) lockhint
          end subroutine kmp_init_lock_with_hint

          subroutine kmp_init_nest_lock_with_hint(lockvar, lockhint)
            use omp_lib_kinds
            integer (kind=omp_nest_lock_kind) lockvar
            integer (kind=omp_lock_hint_kind) lockhint
          end subroutine kmp_init_nest_lock_with_hint

        end interface

!dec$ if defined(_WIN32)
!dec$   if defined(_WIN64) .or. defined(_M_AMD64)

!***
!*** The Fortran entry points must be in uppercase, even if the /Qlowercase
!*** option is specified.  The alias attribute ensures that the specified
!*** string is used as the entry point.
!***
!*** On the Windows* OS IA-32 architecture, the Fortran entry points have an
!*** underscore prepended.  On the Windows* OS Intel(R) 64
!*** architecture, no underscore is prepended.
!***

!dec$ attributes alias:'OMP_SET_NUM_THREADS' :: omp_set_num_threads
!dec$ attributes alias:'OMP_SET_DYNAMIC' :: omp_set_dynamic
!dec$ attributes alias:'OMP_SET_NESTED' :: omp_set_nested
!dec$ attributes alias:'OMP_GET_NUM_THREADS' :: omp_get_num_threads
!dec$ attributes alias:'OMP_GET_MAX_THREADS' :: omp_get_max_threads
!dec$ attributes alias:'OMP_GET_THREAD_NUM' :: omp_get_thread_num
!dec$ attributes alias:'OMP_GET_NUM_PROCS' :: omp_get_num_procs
!dec$ attributes alias:'OMP_IN_PARALLEL' :: omp_in_parallel
!dec$ attributes alias:'OMP_GET_DYNAMIC' :: omp_get_dynamic
!dec$ attributes alias:'OMP_GET_NESTED' :: omp_get_nested
!dec$ attributes alias:'OMP_GET_THREAD_LIMIT' :: omp_get_thread_limit
!dec$ attributes alias:'OMP_SET_MAX_ACTIVE_LEVELS' :: omp_set_max_active_levels
!dec$ attributes alias:'OMP_GET_MAX_ACTIVE_LEVELS' :: omp_get_max_active_levels
!dec$ attributes alias:'OMP_GET_LEVEL' :: omp_get_level
!dec$ attributes alias:'OMP_GET_ACTIVE_LEVEL' :: omp_get_active_level
!dec$ attributes alias:'OMP_GET_ANCESTOR_THREAD_NUM' :: omp_get_ancestor_thread_num
!dec$ attributes alias:'OMP_GET_TEAM_SIZE' :: omp_get_team_size
!dec$ attributes alias:'OMP_SET_SCHEDULE' :: omp_set_schedule
!dec$ attributes alias:'OMP_GET_SCHEDULE' :: omp_get_schedule
!dec$ attributes alias:'OMP_SET_WORKLOAD' :: omp_set_workload

!dec$ attributes alias:'OMP_GET_PROC_BIND' :: omp_get_proc_bind
!dec$ attributes alias:'OMP_GET_WTIME' :: omp_get_wtime
!dec$ attributes alias:'OMP_GET_WTICK' :: omp_get_wtick
!dec$ attributes alias:'OMP_GET_DEFAULT_DEVICE' :: omp_get_default_device
!dec$ attributes alias:'OMP_SET_DEFAULT_DEVICE' :: omp_set_default_device
!dec$ attributes alias:'OMP_GET_NUM_DEVICES' :: omp_get_num_devices
!dec$ attributes alias:'OMP_GET_NUM_TEAMS' :: omp_get_num_teams
!dec$ attributes alias:'OMP_GET_TEAM_NUM' :: omp_get_team_num
!dec$ attributes alias:'OMP_GET_CANCELLATION' :: omp_get_cancellation
!dec$ attributes alias:'OMP_IS_INITIAL_DEVICE' :: omp_is_initial_device
!dec$ attributes alias:'OMP_GET_MAX_TASK_PRIORITY' :: omp_get_max_task_priority

!dec$ attributes alias:'omp_init_lock' :: omp_init_lock
!dec$ attributes alias:'omp_init_lock_with_hint' :: omp_init_lock_with_hint
!dec$ attributes alias:'omp_destroy_lock' :: omp_destroy_lock
!dec$ attributes alias:'omp_set_lock' :: omp_set_lock
!dec$ attributes alias:'omp_unset_lock' :: omp_unset_lock
!dec$ attributes alias:'omp_test_lock' :: omp_test_lock
!dec$ attributes alias:'omp_init_nest_lock' :: omp_init_nest_lock
!dec$ attributes alias:'omp_init_nest_lock_with_hint' :: omp_init_nest_lock_with_hint
!dec$ attributes alias:'omp_destroy_nest_lock' :: omp_destroy_nest_lock
!dec$ attributes alias:'omp_set_nest_lock' :: omp_set_nest_lock
!dec$ attributes alias:'omp_unset_nest_lock' :: omp_unset_nest_lock
!dec$ attributes alias:'omp_test_nest_lock' :: omp_test_nest_lock

!dec$ attributes alias:'KMP_SET_STACKSIZE'::kmp_set_stacksize
!dec$ attributes alias:'KMP_SET_STACKSIZE_S'::kmp_set_stacksize_s
!dec$ attributes alias:'KMP_SET_BLOCKTIME'::kmp_set_blocktime
!dec$ attributes alias:'KMP_SET_LIBRARY_SERIAL'::kmp_set_library_serial
!dec$ attributes alias:'KMP_SET_LIBRARY_TURNAROUND'::kmp_set_library_turnaround
!dec$ attributes alias:'KMP_SET_LIBRARY_THROUGHPUT'::kmp_set_library_throughput
!dec$ attributes alias:'KMP_SET_LIBRARY'::kmp_set_library
!dec$ attributes alias:'KMP_GET_STACKSIZE'::kmp_get_stacksize
!dec$ attributes alias:'KMP_GET_STACKSIZE_S'::kmp_get_stacksize_s
!dec$ attributes alias:'KMP_GET_BLOCKTIME'::kmp_get_blocktime
!dec$ attributes alias:'KMP_GET_LIBRARY'::kmp_get_library
!dec$ attributes alias:'KMP_SET_AFFINITY'::kmp_set_affinity
!dec$ attributes alias:'KMP_GET_AFFINITY'::kmp_get_affinity
!dec$ attributes alias:'KMP_GET_AFFINITY_MAX_PROC'::kmp_get_affinity_max_proc
!dec$ attributes alias:'KMP_CREATE_AFFINITY_MASK'::kmp_create_affinity_mask
!dec$ attributes alias:'KMP_DESTROY_AFFINITY_MASK'::kmp_destroy_affinity_mask
!dec$ attributes alias:'KMP_SET_AFFINITY_MASK_PROC'::kmp_set_affinity_mask_proc
!dec$ attributes alias:'KMP_UNSET_AFFINITY_MASK_PROC'::kmp_unset_affinity_mask_proc
!dec$ attributes alias:'KMP_GET_AFFINITY_MASK_PROC'::kmp_get_affinity_mask_proc
!dec$ attributes alias:'KMP_MALLOC'::kmp_malloc
!dec$ attributes alias:'KMP_ALIGNED_MALLOC'::kmp_aligned_malloc
!dec$ attributes alias:'KMP_CALLOC'::kmp_calloc
!dec$ attributes alias:'KMP_REALLOC'::kmp_realloc
!dec$ attributes alias:'KMP_FREE'::kmp_free

!dec$ attributes alias:'KMP_SET_WARNINGS_ON'::kmp_set_warnings_on
!dec$ attributes alias:'KMP_SET_WARNINGS_OFF'::kmp_set_warnings_off

!dec$ attributes alias:'KMP_GET_CANCELLATION_STATUS' :: kmp_get_cancellation_status

!dec$   else

!***
!*** On Windows* OS IA-32 architecture, the Fortran entry points have an underscore prepended.
!***

!dec$ attributes alias:'_OMP_SET_NUM_THREADS' :: omp_set_num_threads
!dec$ attributes alias:'_OMP_SET_DYNAMIC' :: omp_set_dynamic
!dec$ attributes alias:'_OMP_SET_NESTED' :: omp_set_nested
!dec$ attributes alias:'_OMP_GET_NUM_THREADS' :: omp_get_num_threads
!dec$ attributes alias:'_OMP_GET_MAX_THREADS' :: omp_get_max_threads
!dec$ attributes alias:'_OMP_GET_THREAD_NUM' :: omp_get_thread_num
!dec$ attributes alias:'_OMP_GET_NUM_PROCS' :: omp_get_num_procs
!dec$ attributes alias:'_OMP_IN_PARALLEL' :: omp_in_parallel
!dec$ attributes alias:'_OMP_GET_DYNAMIC' :: omp_get_dynamic
!dec$ attributes alias:'_OMP_GET_NESTED' :: omp_get_nested
!dec$ attributes alias:'_OMP_GET_THREAD_LIMIT' :: omp_get_thread_limit
!dec$ attributes alias:'_OMP_SET_MAX_ACTIVE_LEVELS' :: omp_set_max_active_levels
!dec$ attributes alias:'_OMP_GET_MAX_ACTIVE_LEVELS' :: omp_get_max_active_levels
!dec$ attributes alias:'_OMP_GET_LEVEL' :: omp_get_level
!dec$ attributes alias:'_OMP_GET_ACTIVE_LEVEL' :: omp_get_active_level
!dec$ attributes alias:'_OMP_GET_ANCESTOR_THREAD_NUM' :: omp_get_ancestor_thread_num
!dec$ attributes alias:'_OMP_GET_TEAM_SIZE' :: omp_get_team_size
!dec$ attributes alias:'_OMP_SET_SCHEDULE' :: omp_set_schedule
!dec$ attributes alias:'_OMP_GET_SCHEDULE' :: omp_get_schedule
!dec$ attributes alias:'_OMP_SET_WORKLOAD' :: omp_set_workload

!dec$ attributes alias:'_OMP_GET_PROC_BIND' :: omp_get_proc_bind
!dec$ attributes alias:'_OMP_GET_WTIME' :: omp_get_wtime
!dec$ attributes alias:'_OMP_GET_WTICK' :: omp_get_wtick
!dec$ attributes alias:'_OMP_GET_DEFAULT_DEVICE' :: omp_get_default_device
!dec$ attributes alias:'_OMP_SET_DEFAULT_DEVICE' :: omp_set_default_device
!dec$ attributes alias:'_OMP_GET_NUM_DEVICES' :: omp_get_num_devices
!dec$ attributes alias:'_OMP_GET_NUM_TEAMS' :: omp_get_num_teams
!dec$ attributes alias:'_OMP_GET_TEAM_NUM' :: omp_get_team_num
!dec$ attributes alias:'_OMP_GET_CANCELLATION' :: omp_get_cancellation
!dec$ attributes alias:'_OMP_IS_INITIAL_DEVICE' :: omp_is_initial_device
!dec$ attributes alias:'_OMP_GET_MAX_TASK_PRIORTY' :: omp_get_max_task_priority

!dec$ attributes alias:'_omp_init_lock' :: omp_init_lock
!dec$ attributes alias:'_omp_init_lock_with_hint' :: omp_init_lock_with_hint
!dec$ attributes alias:'_omp_destroy_lock' :: omp_destroy_lock
!dec$ attributes alias:'_omp_set_lock' :: omp_set_lock
!dec$ attributes alias:'_omp_unset_lock' :: omp_unset_lock
!dec$ attributes alias:'_omp_test_lock' :: omp_test_lock
!dec$ attributes alias:'_omp_init_nest_lock' :: omp_init_nest_lock
!dec$ attributes alias:'_omp_init_nest_lock_with_hint' :: omp_init_nest_lock_with_hint
!dec$ attributes alias:'_omp_destroy_nest_lock' :: omp_destroy_nest_lock
!dec$ attributes alias:'_omp_set_nest_lock' :: omp_set_nest_lock
!dec$ attributes alias:'_omp_unset_nest_lock' :: omp_unset_nest_lock
!dec$ attributes alias:'_omp_test_nest_lock' :: omp_test_nest_lock

!dec$ attributes alias:'_KMP_SET_STACKSIZE'::kmp_set_stacksize
!dec$ attributes alias:'_KMP_SET_STACKSIZE_S'::kmp_set_stacksize_s
!dec$ attributes alias:'_KMP_SET_BLOCKTIME'::kmp_set_blocktime
!dec$ attributes alias:'_KMP_SET_LIBRARY_SERIAL'::kmp_set_library_serial
!dec$ attributes alias:'_KMP_SET_LIBRARY_TURNAROUND'::kmp_set_library_turnaround
!dec$ attributes alias:'_KMP_SET_LIBRARY_THROUGHPUT'::kmp_set_library_throughput
!dec$ attributes alias:'_KMP_SET_LIBRARY'::kmp_set_library
!dec$ attributes alias:'_KMP_GET_STACKSIZE'::kmp_get_stacksize
!dec$ attributes alias:'_KMP_GET_STACKSIZE_S'::kmp_get_stacksize_s
!dec$ attributes alias:'_KMP_GET_BLOCKTIME'::kmp_get_blocktime
!dec$ attributes alias:'_KMP_GET_LIBRARY'::kmp_get_library
!dec$ attributes alias:'_KMP_SET_AFFINITY'::kmp_set_affinity
!dec$ attributes alias:'_KMP_GET_AFFINITY'::kmp_get_affinity
!dec$ attributes alias:'_KMP_GET_AFFINITY_MAX_PROC'::kmp_get_affinity_max_proc
!dec$ attributes alias:'_KMP_CREATE_AFFINITY_MASK'::kmp_create_affinity_mask
!dec$ attributes alias:'_KMP_DESTROY_AFFINITY_MASK'::kmp_destroy_affinity_mask
!dec$ attributes alias:'_KMP_SET_AFFINITY_MASK_PROC'::kmp_set_affinity_mask_proc
!dec$ attributes alias:'_KMP_UNSET_AFFINITY_MASK_PROC'::kmp_unset_affinity_mask_proc
!dec$ attributes alias:'_KMP_GET_AFFINITY_MASK_PROC'::kmp_get_affinity_mask_proc
!dec$ attributes alias:'_KMP_MALLOC'::kmp_malloc
!dec$ attributes alias:'_KMP_ALIGNED_MALLOC'::kmp_aligned_malloc
!dec$ attributes alias:'_KMP_CALLOC'::kmp_calloc
!dec$ attributes alias:'_KMP_REALLOC'::kmp_realloc
!dec$ attributes alias:'_KMP_FREE'::kmp_free

!dec$ attributes alias:'_KMP_SET_WARNINGS_ON'::kmp_set_warnings_on
!dec$ attributes alias:'_KMP_SET_WARNINGS_OFF'::kmp_set_warnings_off

!dec$ attributes alias:'_KMP_GET_CANCELLATION_STATUS' :: kmp_get_cancellation_status

!dec$   endif
!dec$ endif

!dec$ if defined(__linux)

!***
!*** The Linux* OS entry points are in lowercase, with an underscore appended.
!***

!dec$ attributes alias:'omp_set_num_threads_'::omp_set_num_threads
!dec$ attributes alias:'omp_set_dynamic_'::omp_set_dynamic
!dec$ attributes alias:'omp_set_nested_'::omp_set_nested
!dec$ attributes alias:'omp_get_num_threads_'::omp_get_num_threads
!dec$ attributes alias:'omp_get_max_threads_'::omp_get_max_threads
!dec$ attributes alias:'omp_get_thread_num_'::omp_get_thread_num
!dec$ attributes alias:'omp_get_num_procs_'::omp_get_num_procs
!dec$ attributes alias:'omp_in_parallel_'::omp_in_parallel
!dec$ attributes alias:'omp_get_dynamic_'::omp_get_dynamic
!dec$ attributes alias:'omp_get_nested_'::omp_get_nested
!dec$ attributes alias:'omp_get_thread_limit_'::omp_get_thread_limit
!dec$ attributes alias:'omp_set_max_active_levels_'::omp_set_max_active_levels
!dec$ attributes alias:'omp_get_max_active_levels_'::omp_get_max_active_levels
!dec$ attributes alias:'omp_get_level_'::omp_get_level
!dec$ attributes alias:'omp_get_active_level_'::omp_get_active_level
!dec$ attributes alias:'omp_get_ancestor_thread_num_'::omp_get_ancestor_thread_num
!dec$ attributes alias:'omp_get_team_size_'::omp_get_team_size
!dec$ attributes alias:'omp_set_schedule_'::omp_set_schedule
!dec$ attributes alias:'omp_get_schedule_'::omp_get_schedule
!dec$ attributes alias:'omp_set_workload_'::omp_set_workload

!dec$ attributes alias:'omp_get_proc_bind_' :: omp_get_proc_bind
!dec$ attributes alias:'omp_get_wtime_'::omp_get_wtime
!dec$ attributes alias:'omp_get_wtick_'::omp_get_wtick
!dec$ attributes alias:'omp_get_default_device_'::omp_get_default_device
!dec$ attributes alias:'omp_set_default_device_'::omp_set_default_device
!dec$ attributes alias:'omp_get_num_devices_'::omp_get_num_devices
!dec$ attributes alias:'omp_get_num_teams_'::omp_get_num_teams
!dec$ attributes alias:'omp_get_team_num_'::omp_get_team_num
!dec$ attributes alias:'omp_get_cancellation_'::omp_get_cancellation
!dec$ attributes alias:'omp_is_initial_device_'::omp_is_initial_device
!dec$ attributes alias:'omp_get_max_task_priority_'::omp_get_max_task_priority

!dec$ attributes alias:'omp_init_lock_'::omp_init_lock
!dec$ attributes alias:'omp_init_lock_with_hint_'::omp_init_lock_with_hint
!dec$ attributes alias:'omp_destroy_lock_'::omp_destroy_lock
!dec$ attributes alias:'omp_set_lock_'::omp_set_lock
!dec$ attributes alias:'omp_unset_lock_'::omp_unset_lock
!dec$ attributes alias:'omp_test_lock_'::omp_test_lock
!dec$ attributes alias:'omp_init_nest_lock_'::omp_init_nest_lock
!dec$ attributes alias:'omp_init_nest_lock_with_hint_'::omp_init_nest_lock_with_hint
!dec$ attributes alias:'omp_destroy_nest_lock_'::omp_destroy_nest_lock
!dec$ attributes alias:'omp_set_nest_lock_'::omp_set_nest_lock
!dec$ attributes alias:'omp_unset_nest_lock_'::omp_unset_nest_lock
!dec$ attributes alias:'omp_test_nest_lock_'::omp_test_nest_lock

!dec$ attributes alias:'kmp_set_stacksize_'::kmp_set_stacksize
!dec$ attributes alias:'kmp_set_stacksize_s_'::kmp_set_stacksize_s
!dec$ attributes alias:'kmp_set_blocktime_'::kmp_set_blocktime
!dec$ attributes alias:'kmp_set_library_serial_'::kmp_set_library_serial
!dec$ attributes alias:'kmp_set_library_turnaround_'::kmp_set_library_turnaround
!dec$ attributes alias:'kmp_set_library_throughput_'::kmp_set_library_throughput
!dec$ attributes alias:'kmp_set_library_'::kmp_set_library
!dec$ attributes alias:'kmp_get_stacksize_'::kmp_get_stacksize
!dec$ attributes alias:'kmp_get_stacksize_s_'::kmp_get_stacksize_s
!dec$ attributes alias:'kmp_get_blocktime_'::kmp_get_blocktime
!dec$ attributes alias:'kmp_get_library_'::kmp_get_library
!dec$ attributes alias:'kmp_set_affinity_'::kmp_set_affinity
!dec$ attributes alias:'kmp_get_affinity_'::kmp_get_affinity
!dec$ attributes alias:'kmp_get_affinity_max_proc_'::kmp_get_affinity_max_proc
!dec$ attributes alias:'kmp_create_affinity_mask_'::kmp_create_affinity_mask
!dec$ attributes alias:'kmp_destroy_affinity_mask_'::kmp_destroy_affinity_mask
!dec$ attributes alias:'kmp_set_affinity_mask_proc_'::kmp_set_affinity_mask_proc
!dec$ attributes alias:'kmp_unset_affinity_mask_proc_'::kmp_unset_affinity_mask_proc
!dec$ attributes alias:'kmp_get_affinity_mask_proc_'::kmp_get_affinity_mask_proc
!dec$ attributes alias:'kmp_malloc_'::kmp_malloc
!dec$ attributes alias:'kmp_aligned_malloc_'::kmp_aligned_malloc
!dec$ attributes alias:'kmp_calloc_'::kmp_calloc
!dec$ attributes alias:'kmp_realloc_'::kmp_realloc
!dec$ attributes alias:'kmp_free_'::kmp_free

!dec$ attributes alias:'kmp_set_warnings_on_'::kmp_set_warnings_on
!dec$ attributes alias:'kmp_set_warnings_off_'::kmp_set_warnings_off
!dec$ attributes alias:'kmp_get_cancellation_status_'::kmp_get_cancellation_status

!dec$ endif

!dec$ if defined(__APPLE__)

!***
!*** The Mac entry points are in lowercase, with an both an underscore
!*** appended and an underscore prepended.
!***

!dec$ attributes alias:'_omp_set_num_threads_'::omp_set_num_threads
!dec$ attributes alias:'_omp_set_dynamic_'::omp_set_dynamic
!dec$ attributes alias:'_omp_set_nested_'::omp_set_nested
!dec$ attributes alias:'_omp_get_num_threads_'::omp_get_num_threads
!dec$ attributes alias:'_omp_get_max_threads_'::omp_get_max_threads
!dec$ attributes alias:'_omp_get_thread_num_'::omp_get_thread_num
!dec$ attributes alias:'_omp_get_num_procs_'::omp_get_num_procs
!dec$ attributes alias:'_omp_in_parallel_'::omp_in_parallel
!dec$ attributes alias:'_omp_get_dynamic_'::omp_get_dynamic
!dec$ attributes alias:'_omp_get_nested_'::omp_get_nested
!dec$ attributes alias:'_omp_get_thread_limit_'::omp_get_thread_limit
!dec$ attributes alias:'_omp_set_max_active_levels_'::omp_set_max_active_levels
!dec$ attributes alias:'_omp_get_max_active_levels_'::omp_get_max_active_levels
!dec$ attributes alias:'_omp_get_level_'::omp_get_level
!dec$ attributes alias:'_omp_get_active_level_'::omp_get_active_level
!dec$ attributes alias:'_omp_get_ancestor_thread_num_'::omp_get_ancestor_thread_num
!dec$ attributes alias:'_omp_get_team_size_'::omp_get_team_size
!dec$ attributes alias:'_omp_set_schedule_'::omp_set_schedule
!dec$ attributes alias:'_omp_get_schedule_'::omp_get_schedule
!dec$ attributes alias:'_omp_set_workload_'::omp_set_workload

!dec$ attributes alias:'_omp_get_proc_bind_' :: omp_get_proc_bind
!dec$ attributes alias:'_omp_get_wtime_'::omp_get_wtime
!dec$ attributes alias:'_omp_get_wtick_'::omp_get_wtick
!dec$ attributes alias:'_omp_get_num_teams_'::omp_get_num_teams
!dec$ attributes alias:'_omp_get_team_num_'::omp_get_team_num
!dec$ attributes alias:'_omp_get_cancellation_'::omp_get_cancellation
!dec$ attributes alias:'_omp_is_initial_device_'::omp_is_initial_device
!dec$ attributes alias:'_omp_get_max_task_priorty_'::omp_get_max_task_priority

!dec$ attributes alias:'_omp_init_lock_'::omp_init_lock
!dec$ attributes alias:'_omp_init_lock_with_hint_'::omp_init_lock_with_hint
!dec$ attributes alias:'_omp_destroy_lock_'::omp_destroy_lock
!dec$ attributes alias:'_omp_set_lock_'::omp_set_lock
!dec$ attributes alias:'_omp_unset_lock_'::omp_unset_lock
!dec$ attributes alias:'_omp_test_lock_'::omp_test_lock
!dec$ attributes alias:'_omp_init_nest_lock_'::omp_init_nest_lock
!dec$ attributes alias:'_omp_init_nest_lock_with_hint_'::omp_init_nest_lock_with_hint
!dec$ attributes alias:'_omp_destroy_nest_lock_'::omp_destroy_nest_lock
!dec$ attributes alias:'_omp_set_nest_lock_'::omp_set_nest_lock
!dec$ attributes alias:'_omp_unset_nest_lock_'::omp_unset_nest_lock
!dec$ attributes alias:'_omp_test_nest_lock_'::omp_test_nest_lock

!dec$ attributes alias:'_kmp_set_stacksize_'::kmp_set_stacksize
!dec$ attributes alias:'_kmp_set_stacksize_s_'::kmp_set_stacksize_s
!dec$ attributes alias:'_kmp_set_blocktime_'::kmp_set_blocktime
!dec$ attributes alias:'_kmp_set_library_serial_'::kmp_set_library_serial
!dec$ attributes alias:'_kmp_set_library_turnaround_'::kmp_set_library_turnaround
!dec$ attributes alias:'_kmp_set_library_throughput_'::kmp_set_library_throughput
!dec$ attributes alias:'_kmp_set_library_'::kmp_set_library
!dec$ attributes alias:'_kmp_get_stacksize_'::kmp_get_stacksize
!dec$ attributes alias:'_kmp_get_stacksize_s_'::kmp_get_stacksize_s
!dec$ attributes alias:'_kmp_get_blocktime_'::kmp_get_blocktime
!dec$ attributes alias:'_kmp_get_library_'::kmp_get_library
!dec$ attributes alias:'_kmp_set_affinity_'::kmp_set_affinity
!dec$ attributes alias:'_kmp_get_affinity_'::kmp_get_affinity
!dec$ attributes alias:'_kmp_get_affinity_max_proc_'::kmp_get_affinity_max_proc
!dec$ attributes alias:'_kmp_create_affinity_mask_'::kmp_create_affinity_mask
!dec$ attributes alias:'_kmp_destroy_affinity_mask_'::kmp_destroy_affinity_mask
!dec$ attributes alias:'_kmp_set_affinity_mask_proc_'::kmp_set_affinity_mask_proc
!dec$ attributes alias:'_kmp_unset_affinity_mask_proc_'::kmp_unset_affinity_mask_proc
!dec$ attributes alias:'_kmp_get_affinity_mask_proc_'::kmp_get_affinity_mask_proc
!dec$ attributes alias:'_kmp_malloc_'::kmp_malloc
!dec$ attributes alias:'_kmp_aligned_malloc_'::kmp_aligned_malloc
!dec$ attributes alias:'_kmp_calloc_'::kmp_calloc
!dec$ attributes alias:'_kmp_realloc_'::kmp_realloc
!dec$ attributes alias:'_kmp_free_'::kmp_free

!dec$ attributes alias:'_kmp_set_warnings_on_'::kmp_set_warnings_on
!dec$ attributes alias:'_kmp_set_warnings_off_'::kmp_set_warnings_off

!dec$ attributes alias:'_kmp_get_cancellation_status_'::kmp_get_cancellation_status

!dec$ endif

      end module omp_lib

