# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

class PatchWorkspaceOperation
  attr_accessor :op, :value, :path

  def initialize(op: nil, path: nil, value: nil)
    @op = op
    @path = path
    @value = value || DataGenerator.title
  end

  def payload
    case path
    when '/forms'
      {
        op: op,
        path: path,
        value: { href: "#{APIConfig.api_request_url}/forms/#{value}" }
      }
    when '/members'
      {
        op: op,
        path: path,
        value: { email: value }
      }
    else
      {
        op: op,
        path: path,
        value: value
      }
    end
  end
end