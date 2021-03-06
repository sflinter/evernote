#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'user_store_types'

            module Evernote
              module EDAM
                module UserStore
                  module UserStore
                    class Client
                      include ::Thrift::Client

                      def checkVersion(clientName, edamVersionMajor, edamVersionMinor)
                        send_checkVersion(clientName, edamVersionMajor, edamVersionMinor)
                        return recv_checkVersion()
                      end

                      def send_checkVersion(clientName, edamVersionMajor, edamVersionMinor)
                        send_message('checkVersion', CheckVersion_args, :clientName => clientName, :edamVersionMajor => edamVersionMajor, :edamVersionMinor => edamVersionMinor)
                      end

                      def recv_checkVersion()
                        result = receive_message(CheckVersion_result)
                        return result.success unless result.success.nil?
                        raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'checkVersion failed: unknown result')
                      end

                      def authenticate(username, password, consumerKey, consumerSecret)
                        send_authenticate(username, password, consumerKey, consumerSecret)
                        return recv_authenticate()
                      end

                      def send_authenticate(username, password, consumerKey, consumerSecret)
                        send_message('authenticate', Authenticate_args, :username => username, :password => password, :consumerKey => consumerKey, :consumerSecret => consumerSecret)
                      end

                      def recv_authenticate()
                        result = receive_message(Authenticate_result)
                        return result.success unless result.success.nil?
                        raise result.userException unless result.userException.nil?
                        raise result.systemException unless result.systemException.nil?
                        raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'authenticate failed: unknown result')
                      end

                      def refreshAuthentication(authenticationToken)
                        send_refreshAuthentication(authenticationToken)
                        return recv_refreshAuthentication()
                      end

                      def send_refreshAuthentication(authenticationToken)
                        send_message('refreshAuthentication', RefreshAuthentication_args, :authenticationToken => authenticationToken)
                      end

                      def recv_refreshAuthentication()
                        result = receive_message(RefreshAuthentication_result)
                        return result.success unless result.success.nil?
                        raise result.userException unless result.userException.nil?
                        raise result.systemException unless result.systemException.nil?
                        raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'refreshAuthentication failed: unknown result')
                      end

                      def getUser(authenticationToken)
                        send_getUser(authenticationToken)
                        return recv_getUser()
                      end

                      def send_getUser(authenticationToken)
                        send_message('getUser', GetUser_args, :authenticationToken => authenticationToken)
                      end

                      def recv_getUser()
                        result = receive_message(GetUser_result)
                        return result.success unless result.success.nil?
                        raise result.userException unless result.userException.nil?
                        raise result.systemException unless result.systemException.nil?
                        raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getUser failed: unknown result')
                      end

                      def getPublicUserInfo(username)
                        send_getPublicUserInfo(username)
                        return recv_getPublicUserInfo()
                      end

                      def send_getPublicUserInfo(username)
                        send_message('getPublicUserInfo', GetPublicUserInfo_args, :username => username)
                      end

                      def recv_getPublicUserInfo()
                        result = receive_message(GetPublicUserInfo_result)
                        return result.success unless result.success.nil?
                        raise result.notFoundException unless result.notFoundException.nil?
                        raise result.systemException unless result.systemException.nil?
                        raise result.userException unless result.userException.nil?
                        raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getPublicUserInfo failed: unknown result')
                      end

                      def getPremiumInfo(authenticationToken)
                        send_getPremiumInfo(authenticationToken)
                        return recv_getPremiumInfo()
                      end

                      def send_getPremiumInfo(authenticationToken)
                        send_message('getPremiumInfo', GetPremiumInfo_args, :authenticationToken => authenticationToken)
                      end

                      def recv_getPremiumInfo()
                        result = receive_message(GetPremiumInfo_result)
                        return result.success unless result.success.nil?
                        raise result.userException unless result.userException.nil?
                        raise result.systemException unless result.systemException.nil?
                        raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getPremiumInfo failed: unknown result')
                      end

                    end

                    class Processor
                      include ::Thrift::Processor

                      def process_checkVersion(seqid, iprot, oprot)
                        args = read_args(iprot, CheckVersion_args)
                        result = CheckVersion_result.new()
                        result.success = @handler.checkVersion(args.clientName, args.edamVersionMajor, args.edamVersionMinor)
                        write_result(result, oprot, 'checkVersion', seqid)
                      end

                      def process_authenticate(seqid, iprot, oprot)
                        args = read_args(iprot, Authenticate_args)
                        result = Authenticate_result.new()
                        begin
                          result.success = @handler.authenticate(args.username, args.password, args.consumerKey, args.consumerSecret)
                        rescue Evernote::EDAM::Error::EDAMUserException => userException
                          result.userException = userException
                        rescue Evernote::EDAM::Error::EDAMSystemException => systemException
                          result.systemException = systemException
                        end
                        write_result(result, oprot, 'authenticate', seqid)
                      end

                      def process_refreshAuthentication(seqid, iprot, oprot)
                        args = read_args(iprot, RefreshAuthentication_args)
                        result = RefreshAuthentication_result.new()
                        begin
                          result.success = @handler.refreshAuthentication(args.authenticationToken)
                        rescue Evernote::EDAM::Error::EDAMUserException => userException
                          result.userException = userException
                        rescue Evernote::EDAM::Error::EDAMSystemException => systemException
                          result.systemException = systemException
                        end
                        write_result(result, oprot, 'refreshAuthentication', seqid)
                      end

                      def process_getUser(seqid, iprot, oprot)
                        args = read_args(iprot, GetUser_args)
                        result = GetUser_result.new()
                        begin
                          result.success = @handler.getUser(args.authenticationToken)
                        rescue Evernote::EDAM::Error::EDAMUserException => userException
                          result.userException = userException
                        rescue Evernote::EDAM::Error::EDAMSystemException => systemException
                          result.systemException = systemException
                        end
                        write_result(result, oprot, 'getUser', seqid)
                      end

                      def process_getPublicUserInfo(seqid, iprot, oprot)
                        args = read_args(iprot, GetPublicUserInfo_args)
                        result = GetPublicUserInfo_result.new()
                        begin
                          result.success = @handler.getPublicUserInfo(args.username)
                        rescue Evernote::EDAM::Error::EDAMNotFoundException => notFoundException
                          result.notFoundException = notFoundException
                        rescue Evernote::EDAM::Error::EDAMSystemException => systemException
                          result.systemException = systemException
                        rescue Evernote::EDAM::Error::EDAMUserException => userException
                          result.userException = userException
                        end
                        write_result(result, oprot, 'getPublicUserInfo', seqid)
                      end

                      def process_getPremiumInfo(seqid, iprot, oprot)
                        args = read_args(iprot, GetPremiumInfo_args)
                        result = GetPremiumInfo_result.new()
                        begin
                          result.success = @handler.getPremiumInfo(args.authenticationToken)
                        rescue Evernote::EDAM::Error::EDAMUserException => userException
                          result.userException = userException
                        rescue Evernote::EDAM::Error::EDAMSystemException => systemException
                          result.systemException = systemException
                        end
                        write_result(result, oprot, 'getPremiumInfo', seqid)
                      end

                    end

                    # HELPER FUNCTIONS AND STRUCTURES

                    class CheckVersion_args
                      include ::Thrift::Struct, ::Thrift::Struct_Union
                      CLIENTNAME = 1
                      EDAMVERSIONMAJOR = 2
                      EDAMVERSIONMINOR = 3

                      FIELDS = {
                        CLIENTNAME => {:type => ::Thrift::Types::STRING, :name => 'clientName'},
                        EDAMVERSIONMAJOR => {:type => ::Thrift::Types::I16, :name => 'edamVersionMajor', :default => 1},
                        EDAMVERSIONMINOR => {:type => ::Thrift::Types::I16, :name => 'edamVersionMinor', :default => 20}
                      }

                      def struct_fields; FIELDS; end

                      def validate
                      end

                      ::Thrift::Struct.generate_accessors self
                    end

                    class CheckVersion_result
                      include ::Thrift::Struct, ::Thrift::Struct_Union
                      SUCCESS = 0

                      FIELDS = {
                        SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'}
                      }

                      def struct_fields; FIELDS; end

                      def validate
                      end

                      ::Thrift::Struct.generate_accessors self
                    end

                    class Authenticate_args
                      include ::Thrift::Struct, ::Thrift::Struct_Union
                      USERNAME = 1
                      PASSWORD = 2
                      CONSUMERKEY = 3
                      CONSUMERSECRET = 4

                      FIELDS = {
                        USERNAME => {:type => ::Thrift::Types::STRING, :name => 'username'},
                        PASSWORD => {:type => ::Thrift::Types::STRING, :name => 'password'},
                        CONSUMERKEY => {:type => ::Thrift::Types::STRING, :name => 'consumerKey'},
                        CONSUMERSECRET => {:type => ::Thrift::Types::STRING, :name => 'consumerSecret'}
                      }

                      def struct_fields; FIELDS; end

                      def validate
                      end

                      ::Thrift::Struct.generate_accessors self
                    end

                    class Authenticate_result
                      include ::Thrift::Struct, ::Thrift::Struct_Union
                      SUCCESS = 0
                      USEREXCEPTION = 1
                      SYSTEMEXCEPTION = 2

                      FIELDS = {
                        SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => Evernote::EDAM::UserStore::AuthenticationResult},
                        USEREXCEPTION => {:type => ::Thrift::Types::STRUCT, :name => 'userException', :class => Evernote::EDAM::Error::EDAMUserException},
                        SYSTEMEXCEPTION => {:type => ::Thrift::Types::STRUCT, :name => 'systemException', :class => Evernote::EDAM::Error::EDAMSystemException}
                      }

                      def struct_fields; FIELDS; end

                      def validate
                      end

                      ::Thrift::Struct.generate_accessors self
                    end

                    class RefreshAuthentication_args
                      include ::Thrift::Struct, ::Thrift::Struct_Union
                      AUTHENTICATIONTOKEN = 1

                      FIELDS = {
                        AUTHENTICATIONTOKEN => {:type => ::Thrift::Types::STRING, :name => 'authenticationToken'}
                      }

                      def struct_fields; FIELDS; end

                      def validate
                      end

                      ::Thrift::Struct.generate_accessors self
                    end

                    class RefreshAuthentication_result
                      include ::Thrift::Struct, ::Thrift::Struct_Union
                      SUCCESS = 0
                      USEREXCEPTION = 1
                      SYSTEMEXCEPTION = 2

                      FIELDS = {
                        SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => Evernote::EDAM::UserStore::AuthenticationResult},
                        USEREXCEPTION => {:type => ::Thrift::Types::STRUCT, :name => 'userException', :class => Evernote::EDAM::Error::EDAMUserException},
                        SYSTEMEXCEPTION => {:type => ::Thrift::Types::STRUCT, :name => 'systemException', :class => Evernote::EDAM::Error::EDAMSystemException}
                      }

                      def struct_fields; FIELDS; end

                      def validate
                      end

                      ::Thrift::Struct.generate_accessors self
                    end

                    class GetUser_args
                      include ::Thrift::Struct, ::Thrift::Struct_Union
                      AUTHENTICATIONTOKEN = 1

                      FIELDS = {
                        AUTHENTICATIONTOKEN => {:type => ::Thrift::Types::STRING, :name => 'authenticationToken'}
                      }

                      def struct_fields; FIELDS; end

                      def validate
                      end

                      ::Thrift::Struct.generate_accessors self
                    end

                    class GetUser_result
                      include ::Thrift::Struct, ::Thrift::Struct_Union
                      SUCCESS = 0
                      USEREXCEPTION = 1
                      SYSTEMEXCEPTION = 2

                      FIELDS = {
                        SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => Evernote::EDAM::Type::User},
                        USEREXCEPTION => {:type => ::Thrift::Types::STRUCT, :name => 'userException', :class => Evernote::EDAM::Error::EDAMUserException},
                        SYSTEMEXCEPTION => {:type => ::Thrift::Types::STRUCT, :name => 'systemException', :class => Evernote::EDAM::Error::EDAMSystemException}
                      }

                      def struct_fields; FIELDS; end

                      def validate
                      end

                      ::Thrift::Struct.generate_accessors self
                    end

                    class GetPublicUserInfo_args
                      include ::Thrift::Struct, ::Thrift::Struct_Union
                      USERNAME = 1

                      FIELDS = {
                        USERNAME => {:type => ::Thrift::Types::STRING, :name => 'username'}
                      }

                      def struct_fields; FIELDS; end

                      def validate
                      end

                      ::Thrift::Struct.generate_accessors self
                    end

                    class GetPublicUserInfo_result
                      include ::Thrift::Struct, ::Thrift::Struct_Union
                      SUCCESS = 0
                      NOTFOUNDEXCEPTION = 1
                      SYSTEMEXCEPTION = 2
                      USEREXCEPTION = 3

                      FIELDS = {
                        SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => Evernote::EDAM::UserStore::PublicUserInfo},
                        NOTFOUNDEXCEPTION => {:type => ::Thrift::Types::STRUCT, :name => 'notFoundException', :class => Evernote::EDAM::Error::EDAMNotFoundException},
                        SYSTEMEXCEPTION => {:type => ::Thrift::Types::STRUCT, :name => 'systemException', :class => Evernote::EDAM::Error::EDAMSystemException},
                        USEREXCEPTION => {:type => ::Thrift::Types::STRUCT, :name => 'userException', :class => Evernote::EDAM::Error::EDAMUserException}
                      }

                      def struct_fields; FIELDS; end

                      def validate
                      end

                      ::Thrift::Struct.generate_accessors self
                    end

                    class GetPremiumInfo_args
                      include ::Thrift::Struct, ::Thrift::Struct_Union
                      AUTHENTICATIONTOKEN = 1

                      FIELDS = {
                        AUTHENTICATIONTOKEN => {:type => ::Thrift::Types::STRING, :name => 'authenticationToken'}
                      }

                      def struct_fields; FIELDS; end

                      def validate
                      end

                      ::Thrift::Struct.generate_accessors self
                    end

                    class GetPremiumInfo_result
                      include ::Thrift::Struct, ::Thrift::Struct_Union
                      SUCCESS = 0
                      USEREXCEPTION = 1
                      SYSTEMEXCEPTION = 2

                      FIELDS = {
                        SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => Evernote::EDAM::UserStore::PremiumInfo},
                        USEREXCEPTION => {:type => ::Thrift::Types::STRUCT, :name => 'userException', :class => Evernote::EDAM::Error::EDAMUserException},
                        SYSTEMEXCEPTION => {:type => ::Thrift::Types::STRUCT, :name => 'systemException', :class => Evernote::EDAM::Error::EDAMSystemException}
                      }

                      def struct_fields; FIELDS; end

                      def validate
                      end

                      ::Thrift::Struct.generate_accessors self
                    end

                  end

                end
              end
            end
